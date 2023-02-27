import axios from 'axios'

const http = axios.create({  
    baseURL: 'http://localhost:8080'
});

export default {
    
    getCollectionDetails(collectionId) {
        return http.get(`/collections/${collectionId}`)
    },

    getAllCollections() {
        return http.get(`/collections`)
    },

    updateCollection(collectionId, collection) {
        return http.put(`/collections/${collectionId}`, collection);
    },

    createCollection(collection) {
        return http.post('/collections', collection)
    },

    deleteCollection(collectionId) {
        return http.delete(`/collections/${collectionId}`)
    },

    updateQuantity(collectionId, card) {
        return http.put(`/collections/${collectionId}/quantity`, card);
    },

    deleteCardFromCollection(collectionId, cardId) {
        return http.delete(`/collections/${collectionId}/${cardId}`);
    },

    getPublicCollectionsByUserId(id) {
        return http.get(`/collections/user-collections/${id}`)
    }
}