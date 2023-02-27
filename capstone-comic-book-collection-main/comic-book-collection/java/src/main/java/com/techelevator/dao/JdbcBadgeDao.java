package com.techelevator.dao;

import com.techelevator.model.Badge;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBadgeDao implements BadgeDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcBadgeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<String> getUserBadges(int id) {
        List<String> badges = new ArrayList<>();

        String sqlQuery = "SELECT badge_name FROM badges_user_has\n" +
                        "WHERE user_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQuery, id);

        while (results.next()){
            Badge badge = mapRowToBadge(results);
            badges.add(badge.getBadgeName());
        }

        return badges;
    }

    @Override
    public void giveUserBadge(int toUserId, int fromUserId, String badgeName) {
        String giveSqlQuery = "INSERT INTO badges_user_has (user_id, badge_name)\n" +
                "VALUES (?, ?)";
        jdbcTemplate.update(giveSqlQuery, toUserId, badgeName);

        String removeSqlQuery = "DELETE FROM badges_user_can_give\n" +
                "WHERE user_id = ? AND badge_name = ?;";
        jdbcTemplate.update(removeSqlQuery, fromUserId, badgeName);
    }

    @Override
    public List<String> getGivableBadges(int id) {
        List<String> badges = new ArrayList<>();

        String sqlQuery = "SELECT badge_name FROM badges_user_can_give\n" +
                          "WHERE user_id = ?";


        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQuery, id);

        while (results.next()){
            Badge badge = mapRowToBadge(results);
            badges.add(badge.getBadgeName());
        }

        return badges;
    }

    private Badge mapRowToBadge(SqlRowSet results) {
        return new Badge(results.getString("badge_name"));
    }
}
