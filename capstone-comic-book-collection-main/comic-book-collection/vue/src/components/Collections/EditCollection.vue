<template>
  <div id="edit-collection">
    <form class="form-container">
      <div id="title-and-close">
        <h1 id="edit-your-collection-header">Edit Your Collection</h1>
      </div>
      <label for="title">Title</label>
      <input 
          type="text"
          name="title"
          id="title"
          placeholder="Title"
          v-model="updatedCollection.title"
      />
      <label for="description">Description</label>
      <input 
          type="text"
          id="description"
          placeholder="Description"
          v-model="updatedCollection.description"
      />
      <div class="switch-div">
        <p class="private-text" style="display: inline-block">public</p>
        <label class="switch">
          <input type="checkbox" v-model="updatedCollection.isPrivate" />
          <span class="slider" />
        </label>
        <p class="private-text" style="display: inline-block">private</p>
      </div>
      <div class="button-holder">
        <button @click.prevent="onSubmit">Submit</button>
        <button @click.prevent="showDeleteCollection" id="delete-button">Delete</button>
      </div>
      <div class="overlay" v-if="$store.state.showDeleteCollection">
        <confirm-delete class="overlay-form" :collection="collection" />
      </div>
    </form>
  </div>
</template>

<script>
import collectionService from '../../services/CollectionService.js';
import confirmDelete from './ConfirmDelete.vue';
export default {
  name: 'edit-collection',
  components: {
      confirmDelete
  },
  data() {
    return {
      updatedCollection: {}
    }
  },
  props: [
    'collection'
  ],
  created() {
    this.updatedCollection = this.collection;
  },
  methods: {
    off() {
        this.$store.commit('CLOSE_OVERLAYS');
    },
    onSubmit() {
      collectionService.updateCollection(this.$route.params.collectionId, this.updatedCollection);
      this.off();
      this.$router.go();
    },
    showDeleteCollection() {
      this.$store.commit('CHANGE_SHOW_DELETE_COLLECTION');
    },
  },
};
</script>

<style scoped>
#edit-collection {
  display: flex;
  justify-content: center;
}

.form-container {
  max-width: 100%;
  margin: 15px;
  background-color: white;
  border-radius: 10px;
  display: flex;
}

#title-and-close {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

#edit-your-collection-header {
  margin-top: 0px;
}

input {
  width: 90%;
  height: 20%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

.switch-div {
  display: flex;
  align-items: center;
  gap: 5px;
}

.private-text {
  text-align: center;
}

.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
  border-radius: 34px;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
  border-radius: 50%;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

.button-holder {
  display: flex;
  justify-content: space-between;
  gap: 30px;
}

button {
  width: 100%;
}

button:hover {
  cursor: pointer;
}

#delete-button {
  color: var(--site-red);
  background-color: white;
  border: solid var(--site-red) 2px;
}
</style>