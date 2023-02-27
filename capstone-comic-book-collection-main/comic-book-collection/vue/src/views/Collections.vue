<template>
    <div>
        <div class="call-to-action text-center" v-if="!isLoggedIn">
                <h1>Want to add your own collection?</h1>
                <button><router-link to="/register">Create an account now!</router-link></button>
        </div>
        <!-- <div class="banner">
            <img data-v-6e0e9e00 src="https://images.pokemontcg.io/bw11/25.png">
        </div> -->
        <div id="main-header" v-if="isLoggedIn">
            <div id="banner">
                <div id="banner-image">
                    <img src="https://images.pokemontcg.io/swsh12pt5/160_hires.png" id="banner-image">
                </div>

                <div id="header-text" class="page-title">
                    <h1>Collections</h1>
                </div>
            </div>
        </div>

        <div v-if="isLoggedIn">
            <h1>Your Collections</h1>
            <collection-grid :collections="personalCollections" :ownedByMe="true"></collection-grid>
        </div>
        <h1>Public Collections</h1>
        <collection-grid :collections="publicCollections" :ownedByMe="false"></collection-grid>
        <overlay />
    </div>
</template>

<script>
import CollectionGrid from "../components/Collections/CollectionGrid.vue"
import Overlay from '../components/Overlay.vue'
import collectionService from "../services/CollectionService"

export default {
    name: "collections",
    components: {
        CollectionGrid,
        Overlay
    },
    data() {
        return {
            personalCollections: [],
            publicCollections: [],
            username: ''
        }
    },
    created() {
        // This initialization calls the logged in user from the store and then contacts our server for all collecitons
        // Then sorts collections into user-ownd collections and public collections 
        this.username = this.$store.state.user.username;
        collectionService.getAllCollections()
                         .then(response => {
                            response.data.forEach(element => {
                                console.log(element);
                                console.log(this.username);
                                if (element.ownerUsername == this.username){
                                    this.personalCollections.push(element)
                                } else {
                                    this.publicCollections.push(element)
                                }
                            })
                         })

    },
    computed: {
        isLoggedIn() {
        return this.$store.state.user.username != null;
      }
    }

}
</script>

    
    

<style scoped>
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

.call-to-action {
    display: grid;
    justify-content: left;

    border: solid 5px #E45052;
    background-color: #f7f8f7;
    color: #E45052;

    width: 100%;
    height: auto;
    height: auto + 40px;
    padding: 10px 12px;

    padding-left: 20px;
    padding-bottom: 30px;
}

button {
    width: 50%;
}

button > a {
    color: #f7f8f7; 
    font-weight: 500;
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

#banner-image {
    object-position: 10% 45%;
}
</style>