package com.techelevator.model;

import java.util.List;

public class CardCollection {
    private int collectionId;
    private String ownerUsername;
    private String title;
    private String description;
    private boolean isPrivate;
    private List<Card> cards;

    public CardCollection(int collectionId, String ownerUsername, String title, String description, boolean isPrivate,
                          List<Card> cards) {
        this.collectionId = collectionId;
        this.ownerUsername = ownerUsername;
        this.title = title;
        this.description = description;
        this.isPrivate = isPrivate;
        this.cards = cards;
    }

    public CardCollection() {
    }

    public int getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(int collectionId) {
        this.collectionId = collectionId;
    }

    public String getOwnerUsername() {
        return ownerUsername;
    }

    public void setOwnerUsername(String ownerUsername) {
        this.ownerUsername = ownerUsername;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isPrivate() {
        return isPrivate;
    }

    public void setIsPrivate(boolean isPrivate) {
        this.isPrivate = isPrivate;
    }

    public List<Card> getCards() {
        return cards;
    }

    public void setCards(List<Card> cards) {
        this.cards = cards;
    }
}
