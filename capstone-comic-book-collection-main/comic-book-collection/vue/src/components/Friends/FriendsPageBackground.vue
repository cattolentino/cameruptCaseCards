<template>
  <div class="profile-page-background">
        <!-- grids -->
    <div :class="'collection-container text-center'">
      <friends-grid :smallView='false' :tinyCard='false' :users='users' ></friends-grid>
    </div>

  </div>
</template>

<script>
import UserService from '../../services/UserService'
import FriendsGrid from './FriendsGrid.vue';

export default {
  name: "friends-page-background",
    components: {
        FriendsGrid
    },
    data() {
    return {
        users: []
    }
    },
    created() {
        // TO-DO: change this to show only user's friends; getAllUsers just for testing
        UserService.getFriends(this.$store.state.user.id)
                    .then(response => {
                        // profile card details
                        this.users = response.data;

                        // add pronouns, stats, and badges

                        // add profile feature content: featured cards, public collections, and friends
                    });
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
</style>