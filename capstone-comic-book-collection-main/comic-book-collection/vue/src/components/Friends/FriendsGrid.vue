<template>    
    <div id="tiny-friend-card-holder" >
        <div v-for="user in users" v-bind:key="user.index" @click="goToProfile(user.id)" :class="tinyCard ? 'tinyCollectionImage' : 'collectionImage'" class="hover-shake">
            <profile-card :class="smallView ? 'tiny-friend-card' : 'medium-card'" :user='user' :small='true' :tinyCard='smallView' ></profile-card>
        </div>
    </div>
</template>

<script>
import ProfileCard from '../Edit Profile/ProfileCard.vue'

export default {
    name: 'friends-grid',
    props: [
        'users',
        'smallView',
        'tinyCard'
    ],
    components: {
        ProfileCard
    },
    methods: {
        goToProfile(userId){
            this.$router.push({name: 'profileWithId', params: {id: userId}})
            if (this.tinyCard) {
                this.$router.go();
            }
        }
        
    }
}
</script>

<style scoped>

.collectionImage {
    width: 200px;
    height: 280px;
    border-radius: 10px;
    margin: 10px;
    position: relative;
    z-index: 1;
    display: flex;
    align-items: flex-end;
}

.tinyCollectionImage {
    width: 83px;
    height: 126px;
    border-radius: 10px;
    display: flex;
    align-items: flex-end;
}

.tiny-friend-card {
    width: 100%;
    height: 100%;
    border: 5px solid #f5e55a;
    border-radius: .25em;
    font-size: x-small;
}

.medium-card {
    height: 80%;
    border-width: 9px;
    border-radius: 10px;
}
.tiny-friend-card:hover,
.medium-card:hover{
    cursor: pointer;
}

#tiny-friend-card-holder{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    align-content: flex-start;
    gap: 20px;
}

</style>