<template>
  <collection-grid :collections="personalCollections" :ownedByMe="true"></collection-grid>
</template>

<script>
import collectionService from "../services/CollectionService";
import CollectionGrid from "../components/Collections/CollectionGrid.vue";
export default {
  name: "users-public-collection",
  components: {
    CollectionGrid
  },
  data() {
    return {
      personalCollections: [],
      username: ''
    }
  },
  created() {
    this.username = this.$store.state.user.username;
    collectionService.getAllCollections().then(response => {
      response.data.forEach(element => {
        if (element.ownerUsername == this.username) {
            this.personalCollections.push(element);
        }
      });
    });
  }
}
</script>