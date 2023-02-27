<template>
<div id="overall-badge-holder">
<div id="give-badge-holder" v-for="badge in badgesToGive" :key="badge.id">
    <img :src="badgeSource(badge)" :alt="badge" />
    <button :class="{ 'disabled' : badgesUserHas.includes(badge) }" @click="giveUserBadge(badge)">Give {{badge}}</button>
    <h3 id="given-away-all-badges" v-if="badgesToGive.size == 0">You have given away all of your badges</h3>
</div>
</div>
</template>

<script>
import badgeService from '../../../services/BadgeService';
export default {
  name: "give-badge",
  data() {
    return {
      badgesToGive: [],
      badgesUserHas: []
    }
  },
  created() {
    badgeService.getGivableBadgesByUserId(this.$store.state.user.id).then(response => 
      this.badgesToGive = response.data
    );
    badgeService.getBadgesByUserId(this.$route.params.id).then(response => {
      this.badgesUserHas =(JSON.parse(JSON.stringify(response.data)));
    }); 
  },
  methods: {
    badgeSource(badge) {
      return require(`../../../../resources/${badge}.png`);
    },
    giveUserBadge(badge){
      badgeService.giveUserBadge(parseInt(this.$route.params.id), this.$store.state.user.id, badge);
      this.$router.go();
    },
    closeGiveBadgeForm(){
      this.$store.commit('CHANGE_SHOW_GIVE_BADGE_FORM');
    }
  }
}
</script>

<style scoped>
#overall-badge-holder {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  row-gap: 2%;
}

#give-badge-holder {
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  background-color: white;
  border-radius: 20px;
  align-items: center;
}

img {
  height: 100px;
  width: 100px;
}

.disabled {
  background-color: grey;
  pointer-events: none;
}

#given-away-all-badges {
  background-color: white;
  border-radius: 20px;
}
</style>