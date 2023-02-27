<template>
<div>
  <div>
    <form class="form-container">
      <h1>Add A New Collection</h1>
      <label for="title">Title</label>
      <input 
        type="text"
        id="title"
        placeholder="Title"
        v-model="collection.title"
      />
      <label for="description">Description</label>
      <input 
        type="text"
        id="description"
        placeholder="Description"
        v-model="collection.description"
      />
      <div id="radio-buttons">
        <label for="private">Private</label>
        <input
          type="radio"
          id="private"
          name="privacy"
          v-model="collection.privacy"
          value="private"
          checked
        />
        <label for="public">Public</label>
        <input
          type="radio"
          id="public"
          name="privacy"
          v-model="collection.privacy"
          value="public"
        />
      </div>
      <button @click.prevent="onSubmit">Submit</button>
    </form>
  </div>
</div>
</template>

<script>
import collectionService from '../../services/CollectionService.js';
export default {
  name: 'add-collection',
  data() {
    return {
      collection: {
        title: '',
        description: '',
        privacy: 'private',
        userId: this.$store.state.user.id
      }
    }
  },
  methods: {
    onSubmit() {
      this.collection.isPrivate = this.collection.privacy == 'private';
      delete this.collection.privacy;
      collectionService.createCollection(this.collection);
      this.collection.privacy = this.collection.isPrivate ? 'private' : 'public';
      this.$store.commit('CHANGE_SHOW_COLLECTION_FORM');
      this.$router.go();
    }
  }
}
</script>

<style scoped>
input {
  width: 90%;
  height: 20%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

#radio-buttons {
  display: flex;
  justify-content: space-between;
}
</style>