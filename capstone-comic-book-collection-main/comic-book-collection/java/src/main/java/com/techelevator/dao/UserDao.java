package com.techelevator.dao;

import com.techelevator.model.User;
import java.util.List;

public interface UserDao {
    List<User> findAll();
    User getUserById(int userId);
    User findByUsername(String username);
    int findIdByUsername(String username);
    boolean create(String username, String password, String role);
    void updateUserProfile(String email, String fullName, String shippingAddress, String bio, String profilePokemon,
                           int userId, boolean isPremium, String pronouns);
    void sendFriendRequest(int idFrom, int idTo);
    List<User> getFriendRequests(int id);
    void acceptFriendRequest(int userFrom, int userTo);
    void deleteFriendRequest(int userFrom, int userTo);
    List<User> getFriends(int id);
}
