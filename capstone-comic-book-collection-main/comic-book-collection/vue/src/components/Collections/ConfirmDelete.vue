<template>
<div class="form-container">
  <h2 id="sure-of-deletion-question">Are you sure you want to delete this collection?</h2>
  <p>This action cannot be undone.</p>
  <div class="button-container">
    <button id="delete-collection" @click="deleteThisCollection">Yes, delete this</button>
    <button @click="off">No, take me back</button>
  </div>
</div>
</template>

<script>
import collectionService from '../../services/CollectionService.js';
export default {
  name: 'confirm-delete',
  props: [
    'collection'
  ],
  methods: {
    off() {
      this.$store.commit('CHANGE_SHOW_DELETE_COLLECTION');
      this.$store.commit('CHANGE_SHOW_EDIT_COLLECTION_FORM');
    },
    deleteThisCollection() {
      collectionService.deleteCollection(this.$route.params.collectionId);
      this.off();
      this.$router.push({name: 'collections'}).then(this.$router.go());
    }
  }
}
</script>

<style scoped>
.form-container {
  margin: 30px;
  margin-top: 100px;
  padding: 40px;
  justify-content: center;
  align-content: center;
}

#sure-of-deletion-question {
  margin: 0px;
}

.button-container {
  display: flex;
  justify-content: space-between;
  gap: 30px;
}

button {
  padding: 0px 10px;
  width: 100%;
}

button:hover {
  cursor: pointer;
}

#delete-collection {
  color: var(--site-red);
  background-color: white;
  border: solid var(--site-red) 2px;
}
</style>