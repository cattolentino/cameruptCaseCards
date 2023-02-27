package com.techelevator.model;

public class Badge {

    private String badgeName;

    public Badge(String badgeName) {
        this.badgeName = badgeName;
    }

    public Badge() {
    }

    public String getBadgeName() {
        return badgeName;
    }

    public void setBadgeName(String badgeName) {
        this.badgeName = badgeName;
    }
}
