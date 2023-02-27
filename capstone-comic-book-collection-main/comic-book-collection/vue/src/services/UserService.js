import axios from 'axios'

const http = axios.create({  
    baseURL: 'http://localhost:8080'
});

export default {
    updateUserBio(user) {
        // delete user.authorities
        return http.put(`/users/update-profile`, user);
    },
    getUserDetails(id) {
        return http.get(`/users/${id}`);
    },
    getUserIdByUsername(username) {
        return http.get(`/users/get-id/${username}`);
    },
    getAllUsers() {
        return http.get(`/users/`);
    },
    getFriends(id) {
        return http.get(`/users/${id}/friends`);
    },
    addFriend(friendRequest) {
        return http.post(`/users/friend-requests`, friendRequest);
    },
    getFriendRequests(userId) {
        return http.get(`/users/friend-requests/${userId}`);
    },
    acceptFriendRequest(friendRequest) {
        return http.put(`/users/friend-requests`, friendRequest);
    },
    deleteFriendRequest(fromUser, toUser) {
        return http.delete(`/users/friend-requests/${fromUser}/${toUser}`);
    },
    getAllCardsForUser(userId) {
        return http.get(`/collections/${userId}/getAllCards`);
    }
}