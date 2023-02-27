package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonAlias;

import java.util.List;

public class Card {
    private String id;
    private String name;
    private Images images;
    private int quantity;
    private String supertype;
    private int hp;
    private String rarity;
    private List<String> subtypes;
    private List<String> types;

    @JsonAlias({"set", "cardSet"})
    private CardSet cardSet;

    public Card(String id, String name, Images images, int quantity, String supertype, int hp, String rarity, List<String> subtypes, List<String> types, CardSet cardSet) {
        this.id = id;
        this.name = name;
        this.images = images;
        this.quantity = quantity;
        this.supertype = supertype;
        this.hp = hp;
        this.rarity = rarity;
        this.subtypes = subtypes;
        this.types = types;
        this.cardSet = cardSet;
    }

    public Card() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Images getImages() {
        return images;
    }

    public void setImages(Images images) {
        this.images = images;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSupertype() {
        return supertype;
    }

    public void setSupertype(String supertype) {
        this.supertype = supertype;
    }

    public int getHp() {
        return hp;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }

    public String getRarity() {
        return rarity;
    }

    public void setRarity(String rarity) {
        this.rarity = rarity;
    }

    public List<String> getSubtypes() {
        return subtypes;
    }

    public void setSubtypes(List<String> subtypes) {
        this.subtypes = subtypes;
    }

    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

    public CardSet getCardSet() {
        return cardSet;
    }

    public void setCardSet(CardSet cardSet) {
        this.cardSet = cardSet;
    }
}
