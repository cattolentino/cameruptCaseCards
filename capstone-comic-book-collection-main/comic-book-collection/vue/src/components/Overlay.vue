<template>
    <div class="overlay" 
    v-if="$store.state.showEditProfile || $store.state.showAddCardForm || $store.state.showEditCollectionForm || 
    $store.state.showAddCollectionForm || $store.state.showGiveBadgeForm || $store.state.showPremiumForm">
        <div class="overlay-form">
            <scrolly :style="{ width: '750px', height: '600px' }">
                <scrolly-viewport>
                    <div class="form-container">
                        <button id="close-overlay" @click="off">X</button>
                        <edit-profile v-if="$store.state.showEditProfile" :cards="cards" />
                        <add-cards v-if="$store.state.showAddCardForm" :collectionId="collectionId" :collectedCardIds="collectedCardIds" />
                        <edit-collection v-if="$store.state.showEditCollectionForm" :collection="collection" />
                        <add-collection v-if="$store.state.showAddCollectionForm" />
                        <give-badge v-if="$store.state.showGiveBadgeForm" />
                        <membership-form v-if="$store.state.showPremiumForm" />
                    </div>
                </scrolly-viewport>
                <scrolly-bar axis="y"></scrolly-bar>
                <scrolly-bar axis="x"></scrolly-bar>
            </scrolly>
        </div>
    </div>
</template>

<script>
import { Scrolly, ScrollyViewport, ScrollyBar } from 'vue-scrolly';
import EditProfile from './Edit Profile/EditProfile.vue';
import AddCards from './Collections/AddCards.vue';
import EditCollection from './Collections/EditCollection.vue';
import GiveBadge from './Edit Profile/features/GiveBadge.vue';
import AddCollection from './Collections/AddCollection.vue';
import MembershipForm from './MembershipForm.vue';

    export default {
        name: 'overlay',
        props: [
            'collection',
            'collectedCardIds',
            'collectionId',
            'cards'
        ],
        components: {
            Scrolly,
            ScrollyViewport,
            ScrollyBar,
            EditProfile,
            AddCards,
            EditCollection,
            GiveBadge,
            AddCollection,
            MembershipForm
        },
        methods: {
            off() {
                this.$store.commit('CLOSE_OVERLAYS');
            }
        }
    }
</script>

<style scoped>
    scrolly:hover {
        cursor: default;
    }

    #close-overlay {
        width: 20px;
        height: 20px;
        align-self: flex-end;
    }

    @media only screen and (max-width: 750px) {
        .scrolly-viewport {
            width: 66%;
            position: fixed;
            left: 50%;
            margin-left: -250px;
        }
    }
    @media only screen and (max-width: 490px) {
        .scrolly-viewport {
            width: 33%;
            position: fixed;
            left: 50%;
            margin-left: -100px;
        }
    }
</style>