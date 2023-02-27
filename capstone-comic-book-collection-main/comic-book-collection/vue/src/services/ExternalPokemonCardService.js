import axios from "axios"

const http = axios.create({  
    baseURL: 'https://api.pokemontcg.io/v2/cards'
});

export default {
    getCardByNamePart(namePart){
        return http.get(`?q=name:*${namePart}*`);
    },
    getCardByElement(element){
        return http.get(`?q=types:${element}`);
    },
    getCardByHpRange(hpStart, hpEnd){
        return http.get(`?q=hp:[${hpStart}, ${hpEnd}]`);
    }
}