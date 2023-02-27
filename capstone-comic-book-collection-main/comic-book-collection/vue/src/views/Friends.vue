<template>
    <div>
        <div id="main-header">
            <div id="banner">
                <div id="banner-image">
                    <img src="https://images.pokemontcg.io/swsh12pt5/130_hires.png" id="banner-image">
                </div>

                <div id="header-text" class="page-title">
                    <h1>Friends</h1>
                </div>
            </div>
        </div>
        <div v-if="pendingRequest">
            <friend-requests />
        </div>
        <div v-if="!friends">
            <h1>Friends</h1>
            <friends-page-background></friends-page-background>
        </div>
        <h1>Rivals</h1>
        <div>
        <users-page-background></users-page-background>
        </div>
    </div>
</template>

<script>
import FriendsPageBackground from '../components/Friends/FriendsPageBackground.vue';
import FriendRequests from '../components/Edit Profile/features/FriendRequests.vue'
import UserService from '../services/UserService';
import UsersPageBackground from '../components/Friends/UsersPageBackground.vue';

export default {
    name: "friends",
    props:['friends'],
    components: {
        FriendsPageBackground,
        FriendRequests,
        UsersPageBackground
        
    },
    data(){
        return{
            pendingRequest: '',
        }
    },
    created(){
        UserService.getFriendRequests(this.$store.state.user.id)
        .then(response => this.pendingRequest = response.data)
    },
}

</script>

<style scoped>

</style>