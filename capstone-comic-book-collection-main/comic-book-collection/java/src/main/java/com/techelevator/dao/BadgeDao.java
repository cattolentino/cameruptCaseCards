package com.techelevator.dao;

import com.techelevator.model.Badge;

import java.util.List;

public interface BadgeDao {

    List<String> getUserBadges(int id);

    void giveUserBadge(int toUserId, int fromUserId, String badgeName);

    List<String> getGivableBadges(int parseInt);
}
