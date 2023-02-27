package com.techelevator.controller;

import com.techelevator.dao.UserDao;
import com.techelevator.model.Authority;
import com.techelevator.model.FriendRequest;
import com.techelevator.model.ProfileDto;
import com.techelevator.model.User;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/users")
@CrossOrigin
public class UserController {
    private final UserDao userDao;

    public UserController(UserDao userDao) {
        this.userDao = userDao;
    }

    @RequestMapping(value = "/get-id/{username}", method = RequestMethod.GET)
    public int findIdByUserName(@PathVariable String username) {
        return userDao.findIdByUsername(username);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public User getUserById(@PathVariable int id) {
        return userDao.getUserById(id);
    }

    @RequestMapping(value="", method = RequestMethod.GET)
    public List<User> getUsers() {
        List<User> users = userDao.findAll();
        for (User user : users) {
            user.setShippingAddress(null);
            user.setEmail(null);
            user.setAuthorities((Set<Authority>) null);
            user.setFullName(null);
        }
        return users;
    }

    @RequestMapping(value = "/update-profile", method = RequestMethod.PUT)
    public void updateUserProfile(Principal principal, @RequestBody ProfileDto user) {
        userDao.updateUserProfile(user.getEmail(), user.getFullName(), user.getShippingAddress(), user.getBio(), user.getProfilePokemon(),
                Math.toIntExact(user.getId()), user.getIsPremium(), user.getPronouns());
    }

    @RequestMapping(value = "/friend-requests", method = RequestMethod.POST)
    public void sendFriendRequest(@RequestBody FriendRequest friendRequest) {
        userDao.sendFriendRequest(friendRequest.getUserFrom(), friendRequest.getUserTo());
    }

    @RequestMapping(value = "/friend-requests", method = RequestMethod.PUT)
    public void acceptFriendRequest(@RequestBody FriendRequest friendRequest) {
        userDao.acceptFriendRequest(friendRequest.getUserFrom(), friendRequest.getUserTo());
    }

    @RequestMapping(value = "/friend-requests/{id}", method = RequestMethod.GET)
    public List<User> getFriendRequests(@PathVariable int id) {
        return userDao.getFriendRequests(id);
    }

    @RequestMapping(path = "/friend-requests/{userFrom}/{userTo}", method = RequestMethod.DELETE)
    public void deleteFriendRequest(@PathVariable int userFrom, @PathVariable int userTo) {
        userDao.deleteFriendRequest(userFrom, userTo);
    }

    @RequestMapping(path = "/{id}/friends", method = RequestMethod.GET)
    public List<User> getFriends(@PathVariable int id) {
        return userDao.getFriends(id);
    }
}
