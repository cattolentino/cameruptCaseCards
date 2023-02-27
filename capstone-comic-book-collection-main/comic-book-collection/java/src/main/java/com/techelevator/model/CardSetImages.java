package com.techelevator.model;

public class CardSetImages {
    private String logo;
    private String symbol;

    public CardSetImages(String logo, String symbol) {
        this.logo = logo;
        this.symbol = symbol;
    }

    public CardSetImages() {
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }
}
