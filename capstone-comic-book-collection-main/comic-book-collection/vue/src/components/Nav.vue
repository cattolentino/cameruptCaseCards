<template>
<nav>
  <a href="/" class="nav-logo"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M160 144c-35.3 0-64-28.7-64-64s28.7-64 64-64c15.7 0 30 5.6 41.2 15C212.4 12.4 232.7 0 256 0s43.6 12.4 54.8 31C322 21.6 336.3 16 352 16c35.3 0 64 28.7 64 64s-28.7 64-64 64c-14.7 0-28.3-5-39.1-13.3l-32 48C275.3 187 266 192 256 192s-19.3-5-24.9-13.3l-32-48C188.3 139 174.7 144 160 144zM144 352l48.4-24.2c10.2-5.1 21.6-7.8 33-7.8c19.6 0 38.4 7.8 52.2 21.6l32.5 32.5c6.3 6.3 14.9 9.9 23.8 9.9c11.3 0 21.8-5.6 28-15l9.7-14.6-59-66.3c-9.1-10.2-22.2-16.1-35.9-16.1H235.1c-13.7 0-26.8 5.9-35.9 16.1l-59.9 67.4L144 352zm19.4-95.8c18.2-20.5 44.3-32.2 71.8-32.2h41.8c27.4 0 53.5 11.7 71.8 32.2l150.2 169c8.5 9.5 13.2 21.9 13.2 34.7c0 28.8-23.4 52.2-52.2 52.2H52.2C23.4 512 0 488.6 0 459.8c0-12.8 4.7-25.1 13.2-34.7l150.2-169z"/></svg>
  cameruptCaseCards</a>
  <div>
    <ul class="nav-list">
      <router-link v-if="isLoggedIn" :to="{ name: 'friends' }">
        <li>
          Friends
        </li>
      </router-link>
      <router-link :to="({ name: 'collections'})">
        <li>
          Card Collections
        </li>
      </router-link>
      <router-link v-if="!isLoggedIn" :to="({ name: 'login'})">
        <li>
          Login
        </li>
      </router-link>
      <router-link v-if="!isLoggedIn" :to="{ name: 'register' }">
        <li>
          Register
        </li>
      </router-link>
      <router-link v-if="isLoggedIn" :to="{ name: 'logout' }">
        <li>
          Logout
        </li>
      </router-link>
      <div id="link-to-my-profile" @click="goToMyProfile()">
        <li id="logged-in-user-info" v-if="isLoggedIn">
          <div id="profile-holder-navbar">
            <p>{{$store.state.user.username}}</p>
          </div>
          <div class="profile-icon-holder">
            <profile-image :small="true" :pokemon="$store.state.user.profilePokemon" :class="'profile-icon'"></profile-image>
          </div>    
        </li>
      </div>
    </ul>
  </div>
</nav>
</template>

<script>
import ProfileImage from './Edit Profile/ProfileImage.vue';
  export default {
    name: 'nav',
    data() {
      return {
        users: []
      }
    },
    components: {
      ProfileImage
    },
    created() {
        // This initialization calls the logged in user from the store and then contacts our server for all collecitons
        // Then sorts collections into user-ownd collections and public collections 
        this.username = this.$store.state.user.username;
        this.user = this.$store.state.user;
        
    },
    computed: {
        isLoggedIn() {
        return this.$store.state.user.username != null;
      }
    },
    methods: {
      goToMyProfile() {
        this.$router.push({ name: 'profileWithId', params: {id: this.$store.state.user.id}});
        this.$router.go();
      }
    }
  };
</script>

<style scoped>
nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: solid var(--site-red);
  padding-top: 10px;
  padding-bottom: 10px;
  font-family: "Flexo-Regular",arial,sans-serif;
  color: var(--site-red);
  font-size: small;
}

svg {
  width: 30px;
}

a {
  text-decoration: none;
  color: var(--site-red);
}

ul {
  list-style: none;
}

.nav-logo {
  font-size: 1.1rem;
  font-weight: 600;
  color: black;
  display: flex;
  align-items: center;
  gap: 10px;
}

.profile-icon-holder {
width: 42px;
height: 42px; 
}

.profile-icon {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.nav-list {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
}

li {
  border: solid var(--site-red) 2px;
  border-radius: 5px;
  display: flex;
  align-items: center;
  padding: 8px;
  height: 70%;
  font-weight: 600;
  position:relative;
}

li:hover {
  color:white;
  cursor: pointer;
}

li:before {
  transition: 0.5s all ease;
  position: absolute;
  top:0;
  left:50%;
  right:50%;
  bottom: 0;
  opacity: 0;
  content: "";
  background-color: var(--site-red);
}

li:hover:before {
  transition: 0.5s all ease;
  left: 0;
  right: 0;
  opacity: 1;
  z-index: -1;
}

#logged-in-user-info {
  display: flex;
  border-left: solid var(--site-red) 2px;
  justify-content: center;
  gap: 5px;
}

#profile-holder-navbar {
  color: black;
  font-size: small;
}

p {
  text-align: center;
}   

#link-to-my-profile:hover {
  cursor: pointer;
}
</style>