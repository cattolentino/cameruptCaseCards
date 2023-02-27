<template>
    <div id="add-collection">
        <div class="form-popup" id="form">
            <form class="form-container">
                <h1>Add A New Friend</h1>
                <label for="username">Username</label>
                <!-- nothing works right now, this is for testing; implement adding a new friend -->
                <input 
                    type="text"
                    username="username"
                    placeholder="id"
                    v-model="friends.username"
                />
                <button id="submit" @click.prevent="onSubmit">Submit</button>
                <button type="button" id="close" v-on:click="off()">Close</button>
            </form>
        </div>
    </div>
</template>

<script>
import collectionService from '../../services/CollectionService.js'

export default{
  name: 'add-friend',
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
      off() {
          this.$store.commit('CHANGE_SHOW_COLLECTION_FORM')
      },
      onSubmit() {
        this.collection.isPrivate = this.collection.privacy == 'private'
        delete this.collection.privacy
        collectionService.createCollection(
              this.collection
            );
        this.collection.privacy = this.collection.isPrivate ? 'private' : 'public'
        this.off();
        this.$router.go()
      }
  },
//   created() {
//       this.userId = this.$store.state.user.userId;
//       console.log(this.$store.state.user)
//   }
};
</script>

<style scoped>

.hide-form {
    display: none;
}

.form-container {
  max-width: 100%;
  margin: 10px;
  background-color: white;
  border-radius: 10px;
}

input{
  width: 90%;
  height: 20%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

#radioButton{
    display: flex;
    justify-content: space-between;
}
</style>