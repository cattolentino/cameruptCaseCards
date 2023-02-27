<template>
    <div :class="smallView ? 'small-collection-container' : 'collection-container'">
        <button class="empty-card" v-on:click="showAddForm" v-if="showAddCollectionButton"><h1 id="add-collection-button-label">+</h1></button>
        <button @click="upgradeToPremium" class="empty-card" v-if="showUpgradeCard"><h3>Standard users may only have three collections at a time 
          <button>Upgrade to Premium</button>
          </h3>
        </button>
        <overlay />
        <div v-for="collection in collections" :key="collection.index"  :class="{ 'collection-image' : !smallView }" class="hover-shake">
            <router-link :class="smallView ? 'small-title-holder' : 'title-holder'" :to="{name: 'collection', params: {collectionId: collection.collectionId}}"> 
                <p class="title">{{collection.title}}</p>
                <p v-if="!ownedByMe && !smallView" class="collection-owner"><em>Owner: {{collection.ownerUsername}}</em></p>
            </router-link>
            <router-link :to="{name: 'collection', params: {collectionId: collection.collectionId}}">    
                <img src="../../../resources/backOfPokemonCard.jpg" alt="" :class="smallView ? 'small-card-back' : 'card-back'">
            </router-link>
            <router-link :to="{name: 'collection', params: {collectionId: collection.collectionId}}">
                <p class="privacy-status" v-if="ownedByMe">{{ collection.private ? "private" : "public" }}</p>
            </router-link>
        </div>
    </div>
</template>

<script>
import Overlay from '../Overlay.vue'

export default {
  name: 'collection-grid',
  props: [
    'collections',
    'ownedByMe',
    'smallView'
  ],
  components: {
    Overlay
  },
  methods: {
    showAddForm() {
      this.$store.commit('CHANGE_SHOW_COLLECTION_FORM');
    },
    upgradeToPremium() {
      // this.$router.push({name: 'profileWithId', params: {id: this.$store.state.user.id}});
      this.$store.commit('CHANGE_SHOW_PREMIUM_FORM');
    }
  },
  computed: {
    showAddCollectionButton() {
      let showForm = !this.smallView;
      if (showForm) {
        showForm = (!!this.$store.state.user);
      }
      if (showForm) {
        showForm = (this.collections.length < 3 || this.$store.state.user.isPremium);
        console.log(this.$store.state.user);
      }
      if (showForm) {
        showForm = this.ownedByMe;
      }
      return showForm;
    },
    showUpgradeCard() {
      let showForm = !this.smallView;
      if (showForm) {
        showForm = (!!this.$store.state.user);
      }
      if (showForm) {
        showForm = (this.collections.length >= 3 && !(this.$store.state.user.isPremium));
      }
      if (showForm) {
        showForm = this.ownedByMe;
      }
      return showForm;
    }
  }
}
</script>

<style scoped>
.collection-container {
  justify-items: center;
  align-items: center;
  padding: 10px 12px;
}

h3 {
  color: black;
}

.small-collection-container {
  width: 100%;
  display: flex;
  justify-items: top;
  height: auto;
  flex-wrap: wrap;
  padding: 10px;
  gap: 1em;
}

#add-collection-button-label {
  font-size: 50pt;
  font-weight: 500;
  color: rgb(109, 109, 109);
}

.collection-image {
  width: 200px;
  height: 280px;
  border: 2px solid rgb(51, 51, 51);
  border-radius: 10px;
  margin: 10px;
  position: relative;
  z-index: 1;
  display: flex;
  align-items: flex-end;
}

.title-holder {
  background-color: rgba(0, 0, 0, 0.85);
  color: white;
  border-radius: 0 0 10px 10px;
  position: absolute;
  z-index: 2;
  width: 100%;
  height: 30%;
  text-align: center;
  padding-top: 5px;
  font-size: 11pt;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 5px;
}

.small-title-holder {
  background-color: rgba(0, 0, 0, 0.75);
  color: white;
  position: absolute;
  z-index: 2;
  width: 100px;
  height: auto;
  font-size: x-small;
  text-align: center;
  padding-top: 5px;
  border-radius:10px 10px  0 0;
}

.title {
  font-weight: 600;
}

.collection-owner {
  font-size: 9.5pt;
}

.card-back {
  position: absolute;
  top: 0;
  left: 0;
  width: 200px;
  height: 280px;
  border-radius: 10px;
}

.small-card-back {
  position: relative;
  top: 0;
  left: 0;
  width: 100px;
  height: 140px;
  border-radius: 10px;
}

.privacy-status {
  z-index: 3;
  color: white;
  position: absolute;
  bottom: 0;
  right: 0;
  font-size: 9.5pt;
}

p {
  margin: 5px;
}
</style>