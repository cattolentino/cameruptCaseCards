package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

public class User {

   private Long id;
   private String username;
   @JsonIgnore
   private String password;
   @JsonIgnore
   private boolean activated;
   private Set<Authority> authorities = new HashSet<>();
   private String email;
   private String fullName;
   private String shippingAddress;
   private String bio;
   private String profilePokemon;
   private boolean isPremium;
   private String pronouns;

   public User() { }

   public User(Long id, String username, String password, String authorities) {
      this.id = id;
      this.username = username;
      this.password = password;
      this.activated = true;
   }

   public User(Long id, String username, String password, String email, String fullName, String shippingAddress, String bio, boolean isPremium, String pronouns) {
      this.id = id;
      this.username = username;
      this.password = password;
      this.activated = true;
      this.email = email;
      this.fullName = fullName;
      this.shippingAddress = shippingAddress;
      this.bio = bio;
      this.isPremium = isPremium;
      this.pronouns = pronouns;
   }

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

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public boolean isActivated() {
      return activated;
   }

   public void setActivated(boolean activated) {
      this.activated = activated;
   }

   public Set<Authority> getAuthorities() {
      return authorities;
   }

   public void setAuthorities(Set<Authority> authorities) {
      this.authorities = authorities;
   }

   public void setAuthorities(String authorities) {
      String[] roles = authorities.split(",");
      for(String role : roles) {
         String authority = role.contains("ROLE_") ? role : "ROLE_" + role;
         this.authorities.add(new Authority(authority));
      }
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;
      User user = (User) o;
      return id == user.id &&
              activated == user.activated &&
              Objects.equals(username, user.username) &&
              Objects.equals(password, user.password) &&
              Objects.equals(authorities, user.authorities);
   }

   @Override
   public int hashCode() {
      return Objects.hash(id, username, password, activated, authorities);
   }

   @Override
   public String toString() {
      return "User{" +
              "id=" + id +
              ", username='" + username + '\'' +
              ", activated=" + activated +
              ", authorities=" + authorities +
              '}';
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
