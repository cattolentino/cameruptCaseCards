<template>
  <div :class="{'tiny-card' : tinyCard, 'small-card' : small}" class="profile-card" >
    <div class="user-header">
        <div class="user-name flexy">
          <!-- user membership type -->
          <p v-if="!small" class="account-type">{{user.isPremium ? "Premium" : "Standard"}}</p>
          <h2  class="user-name flexFont">{{user.username}}</h2>
        </div>
        <div class="flexy">
          <p v-if="!small" class="cards">cards</p>
          <!-- number of cards -->
          <h2 v-if="!small" class="card-count">{{numberOfCards}}</h2>
        </div>
      </div>
    <div id="profile-image-and-pronouns">
      <profile-image class="profile-image" :small="false" :pokemon="user.profilePokemon"></profile-image>
      <div v-if="!small" id="pronouns">
        <p v-if="user.pronouns">Pronouns: {{user.pronouns}}</p>
      </div>
    </div>
    <div v-if="!small">
      <h2 v-if="user.bio">Bio</h2>
      <em><p class="bio card-text">{{user.bio}}</p></em>
      <!-- stats -->
      <h2>User Stats</h2>
      <div class="card-text">
        <p v-if="statistics.length == 0"><em><strong>This user doesn't have any cards in public collections yet.</strong></em></p>
        <em><p v-for="statistic in statistics" :key="statistic">{{statistic}}</p></em>
      </div>
      <!-- badges -->
      <h2 id="badges-label">Badges</h2>
    </div>
    <badge-holder v-if="user != 'wait' && !tinyCard" :small='small' :user='user' class="badge-holder" />
  </div>
</template>

<script>
import profileImage from './ProfileImage.vue'
import BadgeHolder from './features/BadgeHolder.vue'


export default {
    name: "profile-card",
    props: [
        'user',
        'small',
        'tinyCard',
        'cards'
    ],
    data() {
        return {
            badges: []
        }
    },
    components: {
        profileImage,
        BadgeHolder
    },
    computed: {
        numberOfCards(){
            let numberOfCards = 0;
            for (let i= 0; i < this.cards.length; i++){
                numberOfCards += this.cards[i].quantity
            }
            return numberOfCards
        },
        statistics() {
            let cardsAndSets = new Map();
            let cardSets = new Set();
            let setIdsAndNames = new Map();
            for (let i = 0; i < this.cards.length; i++) {
                let card = this.cards[i];
                cardsAndSets.set(card.id, card.cardSet);
                cardSets.add(card.cardSet)
                setIdsAndNames.set(card.cardSet.id, card.cardSet.name)
            }

            let setIdAndQuantities = new Map()
            for (let cardSet of cardsAndSets.values()){
                if (setIdAndQuantities.has(cardSet.id)){
                    setIdAndQuantities.set(cardSet.id, setIdAndQuantities.get(cardSet.id) + 1)
                } else {
                    setIdAndQuantities.set(cardSet.id, 1)
                }
            }

            let setIdsAndPercentages = new Map()
            for(let cardSet of cardSets.values()) {
                setIdsAndPercentages.set(cardSet.id, Math.round((setIdAndQuantities.get(cardSet.id) / cardSet.printedTotal) * 10000) / 100)
            }

            let array = Array.from(setIdsAndPercentages, ([cardSetId, percentage]) => ({ cardSetId, percentage }));
            array.sort((a,b) => { return b.percentage - a.percentage });
            if(array.length > 2){
                array.splice(2);
            }

            let statistics = []
            for(let i = 0; i < array.length; i++){
                statistics.push(`Collected ${array[i].percentage}% of the ${setIdsAndNames.get(array[i].cardSetId)} set.`)
            }
            


            return statistics;    
        }
    }
}

</script>

<style scoped>
.tiny-card .user-name {
    
    text-overflow: ellipsis;
    overflow: hidden;
}
.user-name {
    white-space: nowrap;
}

.small-card {
    white-space: nowrap;
}
/* .user-name{
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
} */
.card-text {
    background-color: rgba(212, 40, 42, 0.5);
    border-radius: .75em;
    padding-left: .5em;
    padding-right: .5em;
    width: fit-content;
    /* border: solid rgb(221, 47, 50, 0.5) .25em; */
}
#profile-image-and-pronouns {
    display: flex;
    flex-direction: column;
    background-color: #d9d9d9;
    border-radius: .5em;
    width: 100%;
    justify-content: center;
    align-items: center;
    padding: 2%;
    align-self: center;
    margin-top: 4%;
}

#pronouns{
    width: 100%;
    font-size: 11pt;
    text-align: center;
    font-weight: 600;
    color: rgb(105, 105, 105);
}


.profile-card {
    display: flex;
    flex-direction: column;
    border: solid #f5e55a 1em;
    border-radius: 1em;
    width: 80%;
    height: 85%;
    aspect-ratio: 3 / 2;
    margin: auto;
    margin-top: 5%;
    margin-bottom: 5%;
    padding: 2% 5% 5% 5%;

    background-image: url("../../../resources/texture.jpg");
    /* background-color: #e93d40; */
    background-color: #ee4043;
    background-blend-mode: overlay;
    background-size: cover;
}

h2 {
    margin-bottom: 0;
    margin-top: 5%;
}

ul {
    margin: 2% 0 0 0;
    padding-left: 8%;
}

p {
    margin-top: 2%;
    margin-bottom: 1%;
    font-weight: 600;
    font-size: 10.8pt;
}

.user-header {
    display: flex;
    justify-content: space-between;
    margin-top: 2%;
}

.cards {
    display: flex;
    padding-top: 5px;
}

.flexy {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 4%;
}

.flexy > p {
    margin: 0 !important;
}
.flexy > h2 {
    margin: 0 !important;
}
.account-type{
    background-color: #d9d9d9;
    border: .25em solid #9092A5;
    border-radius: 1em;
    padding: 3%;
    font-size: .75em;
    font-style: italic;
    font-weight: 600;
    color: #444;
    align-self: center;
    padding-right: 4%;
}
.badge-holder {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 5px;
}

#badges-label {
    margin-bottom: 10px;
}

/* .tiny-card {
    display: flex;
    flex-direction: column;
    border: solid #f5e55a .25em;
    border-radius: 1em;
    width: 80%;
    aspect-ratio: 3 / 2;
    background-color: #e93d40;
    margin: auto;
    margin-top: 5%;
    margin-bottom: 5%;
    padding: 2% 5% 5% 5%;
    font-size: x-small;
} */


</style>