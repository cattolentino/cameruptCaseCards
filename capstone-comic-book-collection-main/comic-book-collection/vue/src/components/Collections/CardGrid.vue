<template>
    <div class="collection-container">
        <div v-for="(card, index) in cards" :key="index">
            <img :src="card.images.small" :alt="card.cardName" class="card-image hover-shake" />
            <div id="quantity-div">
                <button v-if="ownedByMe" class="change-quantity" @click="updateQuantity(card, -1)">-</button>
                <p id="card-quantity"><strong>x{{card.quantity}}</strong></p>
                <button v-if="ownedByMe" class="change-quantity" @click="updateQuantity(card, 1)">+</button>
            </div>
        </div>
    </div>
</template>

<script>
import collectionService from '../../services/CollectionService';
export default {
  name: 'card-grid',
  emits: ['deleteCard'],
  props: [
    "cards",
    "ownedByMe"
  ],
  methods: {
    updateQuantity(card, change) {
      const newQuantity = card.quantity + change;
      if (newQuantity < 1) {
        collectionService.deleteCardFromCollection(this.$route.params.collectionId, card.id);
        this.deleteCard(card);
      } else {
        card.quantity = newQuantity;
        collectionService.updateQuantity(this.$route.params.collectionId, card);
      }
    },
    deleteCard(card) {
      this.$emit('deletecard', card.id);
    }
  }
}
</script>

<style scoped>
.collection-container {
  width: 100%;
  justify-items: center;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
  align-items: center;
  background-color: #879fee;
  height: auto + 40px;
  padding: 10px 0px;
  border-radius: 30px;
  box-shadow:  0 0 3px -1px transparent, 0 0 2px 1px transparent
    , 0 0 5px 0px transparent, 0px 10px 15px -5px rgb(97, 94, 94)
    , 0 2px 20px -5px rgb(97, 94, 94), 0 0 20px 0px transparent;
}

.card-image {
  width: 200px;
  height: 280px;
  border-radius: 10px;
  margin: 10px;
  box-shadow:  0 0 3px -1px transparent, 0 0 2px 1px transparent
    , 0 0 5px 0px transparent, 0px 10px 20px -5px rgb(36, 35, 35)
    , 0 2px 15px -5px rgb(36, 35, 35), 0 0 20px 0px transparent;
  border: none;
}
/* 
img:hover{
    animation: shake 1s;
    animation-iteration-count: infinite;
} */

/* @keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-2deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  30% { transform: translate(3px, 2px) rotate(0deg); }
  40% { transform: translate(1px, -1px) rotate(3deg); }
  50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(5px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(5px, 2px) rotate(0deg); }
  100% { transform: translate(5px, -2px) rotate(-1deg); }
} */

#quantity-div {
  display: flex;
  flex-direction: row;
  margin: 10px;
  margin-top: -10px;
  gap: 5px;
  align-items: center;
}

.change-quantity {
  height: 50%;
  background-color: white;
  border-radius: 50%;
  width: 30px;
  color: var(--site-red);
  font-weight: bold;
}

#card-quantity {
  background-color: var(--site-red);
  color: white;
  text-align: center;
  border-radius: 8px;
  flex-grow: 1;
}
</style>