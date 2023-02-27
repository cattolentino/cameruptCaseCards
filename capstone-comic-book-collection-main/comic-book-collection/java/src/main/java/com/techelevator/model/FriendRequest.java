package com.techelevator.model;

public class FriendRequest {
    private int userFrom;
    private int userTo;

    public FriendRequest(int userFrom, int userTo) {
        this.userFrom = userFrom;
        this.userTo = userTo;
    }

    public FriendRequest() {
    }

    public int getUserFrom() {
        return userFrom;
    }

    public void setUserFrom(int userFrom) {
        this.userFrom = userFrom;
    }

    public int getUserTo() {
        return userTo;
    }

    public void setUserTo(int userTo) {
        this.userTo = userTo;
    }
}
