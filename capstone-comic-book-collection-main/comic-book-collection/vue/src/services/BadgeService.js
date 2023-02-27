import axios from 'axios'

const http = axios.create({  
    baseURL: 'http://localhost:8080'
});

export default {
    getBadgesByUserId(id){
        return http.get(`/badges/${id}`)
    },

    getGivableBadgesByUserId(id){
        return http.get(`/badges/give/${id}`)
    },

    giveUserBadge(toUserId, fromUserId, badge){
        return http.post(`/badges/give/${toUserId}/${fromUserId}`, {badgeName: badge})
    }
}