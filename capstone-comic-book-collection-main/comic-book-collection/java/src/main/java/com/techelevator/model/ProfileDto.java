package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class ProfileDto {
    private Long id;
    private String username;
    private List authorities = new ArrayList();
    private String email;
    private String fullName;
    private String shippingAddress;
    private String bio;
    private String profilePokemon;
    private boolean isPremium;
    private String pronouns;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List getAuthorities() {
        return authorities;
    }

    public void setAuthorities(List authorities) {
        this.authorities = authorities;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getProfilePokemon() {
        return profilePokemon;
    }

    public void setProfilePokemon(String profilePokemon) {
        this.profilePokemon = profilePokemon;
    }

    public boolean getIsPremium() {
        return isPremium;
    }

    public void setIsPremium(boolean isPremium) {
        this.isPremium = isPremium;
    }

    public String getPronouns() {
        return pronouns;
    }

    public void setPronouns(String pronouns) {
        this.pronouns = pronouns;
    }
}
