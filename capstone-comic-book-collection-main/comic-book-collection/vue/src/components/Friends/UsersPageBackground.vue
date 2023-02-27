<template>
  <div class="profile-page-background">
        <!-- grids -->
    <div :class="'collection-container text-center'">
      <friends-grid :smallView='false' :tinyCard='false' :users='filteredUsers' ></friends-grid>
    </div>

  </div>
</template>

<script>
import UserService from '../../services/UserService'
import FriendsGrid from './FriendsGrid.vue';

export default {
  name: "users-page-background",
    components: {
        FriendsGrid
    },
    data() {
    return {
        users: [],
        friends: []
    }
    },
    created() {
        UserService.getAllUsers(this.$store.state.user.id)
                    .then(response => {
                        this.users = response.data;
                    });
        UserService.getFriends(this.$store.state.user.id)
                    .then(response => {
                        this.friends = response.data;
                    });
    },
    computed: {
        filteredUsers() {
            if (!this.$store.state.user) {
                return this.users;
            }
            return this.users.filter(user => {
                if (user.id == this.$store.state.user.id) {
                    return false;
                }
                for (let friend of this.friends) {
                    if (user.id == friend.id) {
                        return false;
                    }
                }
                return true;
            })
        }
    }
    
    
};
</script>
<style scoped>
.page {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-areas: "card features";
    width: 100%;
    height: 95%;
    gap: 50px;
}

.card {
    grid-area: card;
}

.features {
    grid-area: features;
    padding-left: 3%;
}

.collection-container {
    width: 100%;
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
    flex-direction: row;
    background-color: #879fee;
    height: auto;
    padding: 10px 12px;
    margin-bottom: 30px;
    border-radius: 30px;
    box-shadow:  0 0 3px -1px transparent, 0 0 2px 1px transparent
        , 0 0 5px 0px transparent, 0px 10px 15px -5px rgb(97, 94, 94)
        , 0 2px 20px -5px rgb(97, 94, 94), 0 0 20px 0px transparent;
}
</style>