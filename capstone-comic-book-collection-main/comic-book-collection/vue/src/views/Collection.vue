<template>
    <div id="collectionDetails">
      <!-- banner, title, description -->
      <div id="main-header">
        <div id="banner" v-for="(card, index) in cards.slice(0,1)" :key="index">
          <img :src="card.images.large" :alt="card.cardName" id="banner-image">
          
        </div>    
        <div id="header-text">
          <h1 class="collection-title">{{title}}</h1>
          <h4 class="collection-description"><em>{{description}}</em></h4>
          <p class="collection-owner-declaration" v-if="!(ownerUsername == $store.state.user.username)">Collection owner:
            <strong @click="goToUserProfile" class="collection-owner">{{ownerUsername}}</strong>
          </p>
        </div>
      </div>

        <!-- edit/add buttons -->
        <div class="functions">
          <div id="twoButtons">
            <button v-if="ownerUsername == $store.state.user.username" @click="showEditCollection">Edit</button>
            <button v-if="ownerUsername == $store.state.user.username" @click="showAddCard">Add A Card</button>
            <overlay :collection="collection" :collectionId="$route.params.collectionId" :collectedCardIds="cardIds" />
          </div>

          <!-- filtering and stats -->
          <div class="filter-and-stats">
            <select v-model="selectedFilterType" @change="clearFilter">
              <option value="">No Filter</option>
              <option v-for='filterType in filterTypes' :key='filterType' :value='filterType'>{{filterType}}</option>
            </select>
            <select v-if="selectedFilterType == 'Type'" v-model="selectedFilter">
              <option value="">All</option>
              <option v-for='type in types' :key='type' :value='type'>{{type}}</option>
            </select>
            <select v-if="selectedFilterType == 'Subtype'" v-model="selectedFilter">
              <option value="">All</option>
              <option v-for='subtype in subtypes' :key='subtype' :value='subtype'>{{subtype}}</option>
            </select>
            <select v-if="selectedFilterType == 'Set Name'" v-model="selectedFilter">
              <option value="">All</option>
              <option v-for='set in setNames' :key='set' :value='set'>{{set}}</option>
            </select>
            <select v-if="selectedFilterType == 'Rarity'" v-model="selectedFilter">
              <option value="">All</option>
              <option v-for='rarity in rarities' :key='rarity' :value='rarity'>{{rarity}}</option>
            </select>
            <div id="statistics-holder">
              Number of {{selectedFilter}} Cards : {{cardsInFilteredSearch.length}}
            </div>
          </div>
        </div>
        <img id="caught-a-pokemon" v-if="showCaughtPokemon" :src="catchGifSource" alt="Caught a pokemon!">
        <!-- displays all cards in collection -->
        <div id="cardSpread">
          <card-grid :cards='cardsInFilteredSearch' @deletecard="deleteCard" :ownedByMe="$store.state.user.username == ownerUsername"/>
        </div>
    </div>
</template>

<script>
import CardGrid from "../components/Collections/CardGrid.vue" 
import collectionWebService from '../services/CollectionService'
import UserService from '../services/UserService'
import Overlay from '../components/Overlay.vue'

export default {
  name: "collection",
  components: {
      CardGrid,
      Overlay
  },
  data(){
    return {
      ownerUsername: '',
      title: '',
      description: '',
      isPrivate: true,
      cards: [],
      filterTypes: ['Type', 'Subtype', 'Set Name', 'Rarity'],
      selectedFilterType: '',
      types: ['Fire', 'Water', 'Grass', 'Lightning', 'Fighting', 'Psychic','Colorless', 'Darkness', 'Metal', 'Dragon', 'Fairy'],
      selectedFilter: ''
    }
  },
  computed: {
    ownedByMe() {
      return this.ownerUsername == this.$store.state.user.username;
    },
    collection() {
      return {
        ownerUsername: this.ownerUsername,
        title: this.title,
        description: this.description,
        isPrivate: this.isPrivate,
        cards: this.cards,
        id: this.$route.params.id
      }
    },
    cardIds() {
      let cardIds = new Set();
      for (let i = 0; i < this.cards.length; i++) {
        cardIds.add(this.cards[i].id);
      }
      return cardIds;
    },
    catchGifSource(){
      return require(`../../resources/pokeballCatch.gif`) + '?' + Math.random();
    },
    cardsInFilteredSearch() {
      let filteredCards = this.cards;
      if (this.selectedFilter) {
        switch (this.selectedFilterType) {
          case "Supertype":
            filteredCards = this.cards.filter(card => {
                return card.supertype == this.selectedFilter
            })
            break;
          case "Type":
            filteredCards = this.cards.filter(card => {
                return card.types.includes(this.selectedFilter);
            })
            break;
          case "Subtype":
            filteredCards = this.cards.filter(card => {
                return card.subtypes.includes(this.selectedFilter);
            })
            break;
          case "Set Name":
            filteredCards = this.cards.filter(card => {
                return card.cardSet.name == this.selectedFilter
            })
            break;
          case "Rarity":
            filteredCards = this.cards.filter(card => {
                return card.rarity == this.selectedFilter
            })
            break;
        }
      }
      return filteredCards;
    },
    showCaughtPokemon(){
      if (this.$store.state.showCaughtPokemon){
        this.changeShowCaughtPokemon()
      }
      return this.$store.state.showCaughtPokemon;
    },
    getUserId() {
      return UserService.getUserIdByUsername(this.ownerUsername);
    },
    subtypes() {
      let subtypes = new Set();
      for (let i = 0; i < this.cards.length; i++) {
        let card = this.cards[i];
        for (let j = 0; j < card.subtypes.length; j++) {
          let subtype = card.subtypes[j];
          subtypes.add(subtype);
        }
      }
      return subtypes;
    },
    setNames() {
      let setNames = new Set();
      for (let i = 0; i < this.cards.length; i++) {
        let card = this.cards[i];
        setNames.add(card.cardSet.name);
      }
      return setNames;
    },
    rarities() {
      let rarities = new Set();
      for (let i = 0; i < this.cards.length; i++) {
        let card = this.cards[i];
        if (card.rarity) {
          rarities.add(card.rarity);
        }
      }
      return rarities;
    }
  },
  created() {
    collectionWebService.getCollectionDetails(this.$route.params.collectionId)
                        .then(response => {
                            this.ownerUsername = response.data.ownerUsername;
                            this.title = response.data.title;
                            this.description = response.data.description;
                            this.isPrivate = response.data.private;
                            this.cards = response.data.cards;
                        });

  },
  methods: {
    togglePrivacy() {
        const collection = {
            collectionId: this.$route.params.collectionId,
            ownerUsername: this.ownerUsername,
            title: this.title,
            description: this.description,
            isPrivate: this.isPrivate,
            cards: []
        }
        collectionWebService.toggleCollectionPrivacyStatus(this.$route.params.collectionId, collection);
    },
    changeShowCaughtPokemon(){
      setTimeout(() => {  this.$store.commit('CHANGE_SHOW_CAUGHT_POKEMON');
                          this.$router.go(); }, 4930);
        
    },
    deleteThisCollection() {
        collectionWebService.deleteCollection(this.$route.params.collectionId);
        this.$router.push({name: 'ViewCollections'})
                    .then(() => { this.$router.go() })
    },
    showEditCollection() {
      this.$store.commit('CHANGE_SHOW_EDIT_COLLECTION_FORM')
    },
    showAddCard() {
      this.$store.commit('CHANGE_SHOW_ADD_CARD')
    },
    addSelectedCards(selectedCards) {
      for (let card in selectedCards) {
        this.cards.push(card);
      }
      console.log(this.cards);

    },
    deleteCard(id) {
      this.cards = this.cards.filter(card => {
        return card.id != id;
      })
    },
    goToUserProfile() {
      UserService.getUserIdByUsername(this.ownerUsername)
                .then(response => {
                  this.$router.push({name: 'profileWithId', params: {id: response.data}});
              })
    },
    clearFilter(){
      this.selectedFilter = ''
    }
  }
}

</script>

<style scoped>
button{
  width:200px;
}

#main-header {
 width: 100%;
 height: 300px;
  display: grid;
  grid-template-rows: 1fr;
  grid-template-areas: "banner";
  margin-bottom: 40px;
}
#banner {
  width: 100%;
  height: 300px;
  /* background-color: rgb(49, 49, 49); */

  display: flex;
  justify-content: center;

  position: relative;
  z-index: 1;
}
#banner-image {
  width: 100%;
  height: 300px;
  object-fit: cover;
  object-position: 10% 20%;
}
#header-text {
  z-index: 2;
  width: 80%;
  height: 300px;
  position: absolute;
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin: 0px;
  background-color: rgba(0, 0, 0, 0.5);
}

#collectionDetails{
  display: flex;
  flex-direction: column;
}

#twoButtons{
  display: flex;
  /* grid-template-columns: 200px 200px; */
  gap: 10px;
  flex-wrap: wrap;
}

#cardSpread{
  margin-top: 20px;
}

.button-container {
  display: flex;
  justify-content: space-between;
}

card-grid {
    display: flex;
    justify-content: center;
    width: 80vw;
}
#caught-a-pokemon{
  position: fixed;
  top: 30%;
  left: 35%;
  height: 30%;
  width: 30%;
  z-index: 10;
  border-radius: 1em;
  border: solid black .5em;
}
.collection-title, .collection-owner-declaration, .collection-description {
    text-align: center;
    margin: 10px;
    color: white;
}
.collection-owner-declaration {
  font-size: 10pt;
}

.switch-div {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  gap: 10px;
}

#ownerUsername {
  color: var(--site-red);
}

#ownerUsername:hover {
  cursor: pointer;
}

.functions {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}
.filter-and-stats {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 25px;
}
.collection-owner {
    text-decoration: underline;
}
.collection-owner:hover {
    cursor:pointer;
    text-decoration: underline;
}

</style>