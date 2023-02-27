<template>
<div>
  <p id="no-badges-label" v-if="badges.length == 0 && !small"><em><strong>This user doesn't have any badges yet.</strong></em></p>
  <img v-for="badge in badges" :key="badge.id" :src="badgeSource(badge)" :alt="badge" :class="small ? 'small-badge' : 'badge'">
</div>
</template>

<script>
import badgeService from '../../../services/BadgeService';
export default {
  name: 'badge-holder',
  props: [
    'user',
    'small'
  ],
  data() {
    return {
      badges: ''
    }
  },
  methods: {
    badgeSource(badge) {
      return require(`../../../../resources/${badge}.png`);
    }
  },
  created() {
    badgeService.getBadgesByUserId(this.user.id).then(response => {
      this.badges =(JSON.parse(JSON.stringify(response.data)));
    });
  }
}
</script>

<style scoped>
#no-badges-label {
  font-style: italic;
  font-weight: bold;
  margin-top: -.5em;
  background-color: rgba(212, 40, 42, 0.5);
  border-radius: .75em;
  padding-left: .5em;
  padding-right: .5em;
  width: fit-content;
}

.badge {
  height: 40px;
  width: 40px;
}

.small-badge {
  height: 30px;
  width: 30px;
}
</style>