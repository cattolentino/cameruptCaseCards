<template>
<div id="profile-page">
  <div id="edit-profile">
    <div class="profile-pic">
      <h1>Edit Profile</h1>
      <profile-image :small="false" :pokemon="newPokemon" />
    </div>
    <h2>Profile Information</h2>
    <form action="">
      <label for="select-profile-pokemon" class="input-label">Profile Pokemon
        <select-profile-pokemon id="select-profile-pokemon" @changeProfilePokemon="(selectedPokemon) => newPokemon = selectedPokemon"/>
      </label>
      <label for="pronouns" class="input-label">Pronouns
        <input v-model="user.pronouns" id="pronouns">
      </label>
      <label for="bio" class="input-label">Bio
        <input v-model="user.bio" id="bio">
      </label>
      <h2>Shipping Information</h2>
      <label for="fullName" class="input-label">Full Name
        <input v-model="user.fullName" type="text">
      </label>
      <label for="streetAddress" class="input-label">Full Address
        <input v-model="user.shippingAddress" type="text">
      </label>
      <div class="button-div">
        <button @click="updateProfile()" type="submit">Save</button>
      </div>
    </form>
  </div>
</div>
</template>

<script>
import userService from "../../services/UserService";
import ProfileImage from './ProfileImage.vue';
import SelectProfilePokemon from './SelectProfilePokemon.vue';
export default {
  name: "edit-profile",
  components: {
    SelectProfilePokemon,
    ProfileImage
  },
  data() {
    return{
      user: {},
      newPokemon: ''
    }
  },
  props: [
    'cards'
  ],
  created() {
    this.user = this.$store.state.user;
    this.newPokemon = this.user.profilePokemon;
  },
  methods: {
    updateProfile() {
      this.user.profilePokemon = this.newPokemon;
      this.$store.commit('SET_USER', this.user);
      userService.updateUserBio(this.user);
      this.$router.push({name: 'profileWithId', params: {id: this.$store.state.user.id}});
      this.$router.go();
    }
  }
}
</script>

<style scoped>
form { 
  padding: 0px;
}

button {
  width: 100%;
}

img {
  width: 20%;
}

.button-div {
  display: flex;
  gap: 15px;
  text-align: center;
}

.profile-pic {
  display: flex;
  gap: 15px;
  justify-content: space-between;
}

.input-label {
  display: flex;
  flex-direction: column;
  gap: 0.25em;
}

#profile-page {
  top: 15%;
  align-items: center;
}

#edit-profile {
  padding: 5%;
  margin-top: 5%;
}
</style>