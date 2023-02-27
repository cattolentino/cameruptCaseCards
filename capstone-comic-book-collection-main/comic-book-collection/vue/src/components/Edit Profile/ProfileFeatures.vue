<template>
  <div class="profile-features">
    <div class="feature-holder">
        <div class="buttons-holder">
            <button v-if="$store.state.user.id == $route.params.id" @click="editProfile()">Edit Profile</button>
            <button v-if="$store.state.user.id == $route.params.id" @click="changePremiumStatus()">Change Membership</button>
            <button v-if="showAddFriend && isLoggedIn" @click="addFriend">Add Friend</button>
            <button v-if="!($store.state.user.id == $route.params.id) && isLoggedIn" @click="showGiveBadgeForm">Give Badge</button>
        </div>
        <div class="featured-cards-holder">
            <h3>Featured Cards</h3>
            <p v-if="cards.length == 0"><em>This user doesn't have any cards in public collections yet.</em></p>
            <div class="featured-cards">
                <img v-for="card in cards.slice(0, 5)" :key="card" :src="card.images.small" style="width: 100px; height: 140px;"  class="hover-shake"/>
            </div>
        </div>
        <div class="public-collections">
            <h3>Public Collections</h3>
            <p v-if="publicCollections.length == 0"><em>This user doesn't have any public collections yet.</em></p>
            <div>
                <collection-grid :smallView="true" :collections="publicCollections"></collection-grid>
            </div>
        </div>
        <div class="friends">
            <h3 v-if="friends.length != 0">Friends</h3>
            <friends-grid id="tiny-friend-cards" :smallView='true' :tinyCard="true" :users="friends" />
        </div>
    </div>
  </div>
</template>

<script>
import userService from '../../services/UserService'
import collectionService from '../../services/CollectionService'
import CollectionGrid from '../Collections/CollectionGrid.vue'
import FriendsGrid from '../Friends/FriendsGrid.vue'

export default {
    name: "profile-features",
    data() {
        return {
            publicCollections: {},
            friends: '',
            buttonPushed: false,
            pendingRequest: 'wait'
        }
    },
    props: [
        'badges',
        'cards'
    ],
    computed: {
        showAddFriend() {
            if (this.pendingRequest == 'wait') {
                return false;
            }
            if (this.$store.state.user.id == this.$route.params.id) { return false; }
            for (let friend of this.friends) {
                if (this.$store.state.user.id == friend.id) {
                    return false;
                }
            }
            if (this.buttonPushed) {
                return false;
            }

            for (let request of this.pendingRequest){
                if (request.id == this.$store.state.user.id || request.id == this.$route.params.id){
                    return false;
                }
            }
            return true;
        },
        isLoggedIn() {
            return this.$store.state.user.username != null;
        }
    },
    components: {
        CollectionGrid,
        FriendsGrid
    },
    methods:{
        editProfile(){
            this.$store.commit('CHANGE_SHOW_EDIT_PROFILE');
        },
        addFriend() {
            this.buttonPushed = true;
            userService.addFriend({userFrom: this.$store.state.user.id, userTo: this.$route.params.id});
        },
        showGiveBadgeForm(){
            this.$store.commit('CHANGE_SHOW_GIVE_BADGE_FORM');
        },
        changePremiumStatus() {
            this.$store.commit('CHANGE_SHOW_PREMIUM_FORM');
        }
    },
    created(){
        collectionService.getPublicCollectionsByUserId(this.$route.params.id)
                        .then(response => this.publicCollections = response.data);
        userService.getFriends(this.$route.params.id)
                        .then(response => this.friends = response.data);
        userService.getFriendRequests(this.$route.params.id)
                        .then(response => this.pendingRequest = response.data);
        userService.getFriendRequests(this.$store.state.user.id)
                        .then(response => this.pendingRequest = this.pendingRequest.concat(response.data));
    }
};
</script>

<style scoped>
button{
    width: 30%;
    font-size: small;
}
.empty-card {
    width: 100px;
    height: 140px;
}

.buttons-holder{
    display: flex;
    gap: 10px;
    justify-content: left;
    margin-bottom: 5px;
}

h3 {
    margin-bottom: 10px;
}

.feature-holder {
    display:flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    justify-content: top;
    margin-top: 70px;
    margin-bottom: 50px;
}

.small-collection-container {
    padding: 0;
}

.featured-cards {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 1em;
}

#tiny-friend-cards {
    margin-top: 2em;
    display: flex;
    gap: 2em;
    flex-wrap: wrap;
}


</style>
