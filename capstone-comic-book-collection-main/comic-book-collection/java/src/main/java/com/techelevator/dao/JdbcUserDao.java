package com.techelevator.dao;

import com.techelevator.model.Badge;
import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

@Service
public class JdbcUserDao implements UserDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcUserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int findIdByUsername(String username) {
        return jdbcTemplate.queryForObject("select user_id from users where username = ?", int.class, username);
    }

	@Override
	public User getUserById(int userId) {
		String sql = "SELECT * FROM users\n" +
                "JOIN profile_pokemons ON users.profile_pokemon = profile_pokemons.image_id\n" +
                "WHERE user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
		if(results.next()) {
			return mapRowToUser(results);
		} else {
			throw new RuntimeException("userId "+userId+" was not found.");
		}
	}

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users\n" +
                "JOIN profile_pokemons ON users.profile_pokemon = profile_pokemons.image_id\n";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            User user = mapRowToUser(results);
            users.add(user);
        }

        return users;
    }

    @Override
    public User findByUsername(String username) throws UsernameNotFoundException {
        for (User user : this.findAll()) {
            if( user.getUsername().toLowerCase().equals(username.toLowerCase())) {
                return user;
            }
        }
        throw new UsernameNotFoundException("User " + username + " was not found.");
    }

    @Override
    public boolean create(String username, String password, String role) {
        boolean userCreated = false;

        // create user
        String insertUser = "insert into users (username,password_hash,role,profile_pokemon) values(?,?,?,1)";
        String password_hash = new BCryptPasswordEncoder().encode(password);
        String ssRole = "ROLE_" + role.toUpperCase();

        GeneratedKeyHolder keyHolder = new GeneratedKeyHolder();
        String id_column = "user_id";
        userCreated = jdbcTemplate.update(con -> {
                    PreparedStatement ps = con.prepareStatement(insertUser, new String[]{id_column});
                    ps.setString(1, username);
                    ps.setString(2, password_hash);
                    ps.setString(3, ssRole);
                    return ps;
                }
                , keyHolder) == 1;
        int newUserId = (int) keyHolder.getKeys().get(id_column);

        String getBadgesSqlQuery = "SELECT badge_name FROM badges;";
        List<String> allBadges = new ArrayList<>();
        SqlRowSet badgesResults = jdbcTemplate.queryForRowSet(getBadgesSqlQuery);
        while (badgesResults.next()){
            allBadges.add(badgesResults.getString("badge_name"));
        }

        String userIdQuery = "SELECT user_id FROM users\n" +
                "WHERE username = ?;";
        SqlRowSet userIdResults = jdbcTemplate.queryForRowSet(userIdQuery, username);
        userIdResults.next();
        int userId = userIdResults.getInt("user_id");

        String badgeSqlQuery = "INSERT INTO badges_user_can_give (user_id, badge_name)\n" +
                "VALUES (?, ?);";

        for (String badge : allBadges) {
            jdbcTemplate.update(badgeSqlQuery, userId, badge);
        }

        return userCreated;
    }

    @Override
    public void updateUserProfile(String email, String fullName, String shippingAddress, String bio,
                                  String profilePokemon, int userId, boolean isPremium, String pronouns) {
        String sqlQuery = "UPDATE users SET\n" +
                "email = ?,\n" +
                "full_name = ?,\n" +
                "shipping_address = ?,\n" +
                "bio = ?,\n" +
                "is_premium = ?,\n" +
                "pronouns = ?,\n" +
                "profile_pokemon = (SELECT image_id from profile_pokemons WHERE pokemon = ?)\n" +
                "WHERE user_id = ?;";
        jdbcTemplate.update(sqlQuery, email, fullName, shippingAddress, bio, isPremium, pronouns, profilePokemon,
                userId);
    }

    @Override
    public void sendFriendRequest(int idFrom, int idTo) {
        String sqlQuery = "INSERT INTO friends (from_user_id, to_user_id)\n" +
                "VALUES (?, ?);";
        jdbcTemplate.update(sqlQuery, idFrom, idTo);
    }

    @Override
    public void acceptFriendRequest(int userFrom, int userTo) {
        String sqlQuery = "UPDATE friends SET accepted = true\n" +
                "WHERE from_user_id = ? AND to_user_id = ?;";
        jdbcTemplate.update(sqlQuery, userFrom, userTo);
    }

    @Override
    public void deleteFriendRequest(int userFrom, int userTo) {
        String sqlQuery = "DELETE FROM friends WHERE from_user_id = ? AND to_user_id = ?;";
        jdbcTemplate.update(sqlQuery, userFrom, userTo);
    }

    @Override
    public List<User> getFriends(int id) {
        String sqlQuery = "SELECT user_from.username AS from_username, user_from.user_id AS from_id, " +
                "user_from_profile_pokemon.pokemon AS from_pokemon, " +
                "user_to.username AS to_username, user_to.user_id AS to_id, " +
                "user_to_profile_pokemon.pokemon AS to_pokemon FROM friends\n" +
                "JOIN users AS user_from ON user_from.user_id = friends.from_user_id\n" +
                "JOIN users AS user_to ON user_to.user_id = friends.to_user_id\n" +
                "JOIN profile_pokemons AS user_from_profile_pokemon ON user_from.profile_pokemon = user_from_profile_pokemon.image_id\n" +
                "JOIN profile_pokemons AS user_to_profile_pokemon ON user_to.profile_pokemon = user_to_profile_pokemon.image_id\n" +
                "WHERE accepted = true\n" +
                "AND (user_from.user_id = ? OR user_to.user_id = ?);";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQuery, id, id);
        List<User> friends = new ArrayList<>();
        while (results.next()) {
            User friend = new User();
            friend.setUsername(results.getString("from_username"));
            friend.setId(results.getLong("from_id"));
            friend.setProfilePokemon(results.getString("from_pokemon"));
            if (friend.getId() != id) {
                friends.add(friend);
            }

            friend = new User();
            friend.setUsername(results.getString("to_username"));
            friend.setId(results.getLong("to_id"));
            friend.setProfilePokemon(results.getString("to_pokemon"));
            if (friend.getId() != id) {
                friends.add(friend);
            }
        }
        return friends;
    }

    @Override
    public List<User> getFriendRequests(int id) {
        List<User> users = new ArrayList<>();
        String sqlQuery = "SELECT from_user_id, username FROM friends\n" +
                "JOIN users ON from_user_id = users.user_id\n" +
                "WHERE to_user_id = ?\n" +
                "AND accepted = false;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQuery, id);
        while (results.next()) {
            User user = new User();
            user.setId(results.getLong("from_user_id"));
            user.setUsername(results.getString("username"));
            users.add(user);
        }
        return users;
    }

    private User mapRowToUser(SqlRowSet rs) {
        User user = new User();
        user.setId(rs.getLong("user_id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password_hash"));
        user.setAuthorities(rs.getString("role"));
        user.setActivated(true);
        user.setEmail(rs.getString("email"));
        user.setFullName(rs.getString("full_name"));
        user.setShippingAddress(rs.getString("shipping_address"));
        user.setBio(rs.getString("bio"));
        user.setProfilePokemon(rs.getString("pokemon"));
        user.setIsPremium(rs.getBoolean("is_premium"));
        user.setPronouns(rs.getString("pronouns"));
        return user;
    }
}
