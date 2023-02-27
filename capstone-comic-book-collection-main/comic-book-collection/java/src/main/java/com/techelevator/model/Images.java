package com.techelevator.model;

public class Images {
    private String large;
    private String small;

    public Images(String large, String small) {
        this.large = large;
        this.small = small;
    }

    public Images() {}

    public String getLarge() {
        return large;
    }

    public void setLarge(String large) {
        this.large = large;
    }

    public String getSmall() {
        return small;
    }

    public void setSmall(String small) {
        this.small = small;
    }
}
