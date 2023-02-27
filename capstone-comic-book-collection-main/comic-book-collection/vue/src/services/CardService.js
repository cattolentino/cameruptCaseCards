import axios from "axios"

const http = axios.create({  
    baseURL: 'http://localhost:8080'
});

export default {
    getAllCards(){
        return http.get(`/cards`);
    },

    addCards(collectionId, cards) {
        return http.post(`/cards/${collectionId}`, cards);
    }
}