<template>
<div id="add-cards-container">
  <input type="text" v-model="internalSearchParamater" id="search-bar" />
  <div id="button-bar">
    <button @click="addSelectedCards">Add selected</button>
    <label for="search-all-cards">Not finding the right card?
      <button id="search-all-cards" @click="searchAllCards">Search all cards</button>
    </label>
  </div>
  <div id="choose-a-card">
    <img class="card-image selected-card" v-for="card in selectedCards" :key="card.id" :src="card.images.small" @click="removeFromSelectedCards(card)" />
    <img class="card-image" v-for="card in filteredCards" :key="card.id" :src="card.images.small" @click="addToSelectedCards(card)" />
    <img class="card-image" v-for="card in filteredExternalCards" :key="card.id" :src="card.images.small" @click="addToSelectedCards(card)" />
  </div>
</div>
</template>

<script>
import cardService from "../../services/CardService";
import externalPokemonCardService from "../../services/ExternalPokemonCardService";
export default {
  name: "add-cards",
  data() {
    return {
      internalSearchParamater: '',
      internalCards: [],
      externalCards: [],
      selectedCards: []
    }
  },
  props: [
    'collectionId',
    'collectedCardIds'
  ],
  computed: {
    filteredCards(){
      let filteredCards = this.internalCards.filter(card => {
        return card.name.toLowerCase().includes(this.internalSearchParamater.toLowerCase())
      });
      filteredCards = filteredCards.filter(card => {
        return !this.selectedIds.has(card.id);
      });
      filteredCards = filteredCards.filter(card => {
        return !this.collectedCardIds.has(card.id);
      });
      return filteredCards;
    },
    selectedIds() {
      const selectedIds = new Set();
      for (let i = 0; i < this.selectedCards.length; i++) {
        selectedIds.add(this.selectedCards[i].id)
      }
      return selectedIds;
    },
    filteredCardIds() {
      const idsFromFilteredCards = new Set();
      for (let i = 0; i < this.filteredCards.length; i++) {
        idsFromFilteredCards.add(this.filteredCards[i].id);
      }
      return idsFromFilteredCards;
    },
    filteredExternalCards() {
      return this.externalCards.filter(card => {
        return !this.selectedIds.has(card.id) && !this.filteredCardIds.has(card.id) && !this.collectedCardIds.has(card.id);
      })
    }
  },
  created() {
    cardService.getAllCards().then(response => {
      this.internalCards = response.data
    });
  },
  methods: {
    searchAllCards() {
      externalPokemonCardService.getCardByNamePart(this.internalSearchParamater).then(response => 
        this.externalCards = response.data.data
      );
    },
    off() {
      this.externalCards = [];
      this.$store.commit('CHANGE_SHOW_ADD_CARD')
    },
    addToSelectedCards(card) {
      this.selectedCards.push(card);
    },
    removeFromSelectedCards(card) {
      this.selectedCards = this.selectedCards.filter(selectedCard => {
        return selectedCard.id != card.id
      });
    },
    addSelectedCards() {
      cardService.addCards(this.collectionId, this.selectedCards);
      this.selectedCards = [];
      this.off();
      this.$store.commit('CHANGE_SHOW_CAUGHT_POKEMON');
    }
  }
}
</script>

<style scoped>
#add-cards-container {
    display: flex;
    flex-direction: column;
}

#search-bar {
    width: 80%;
    align-self: center;
    margin-bottom: 20px;
}

#button-bar {
    display: flex;
    justify-content: space-around;
    margin-bottom: 10px;
}

#choose-a-card {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
}

.card-image {
    width: 200px;
    height: 280px;
    border: 2px solid rgb(161, 161, 161);
    border-radius: 10px;
    margin: 5px;
}

.card-image:hover{
    cursor: pointer;
}

.selected-card {
    border: blue 10px solid;
}
</style>