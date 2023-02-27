package com.techelevator.controller;


import com.techelevator.dao.CardDao;
import com.techelevator.model.Card;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping(path = "/cards")
@RestController
@CrossOrigin
public class CardController {
    private final CardDao cardDao;

    public CardController(CardDao cardDao) {
        this.cardDao = cardDao;
    }

    @RequestMapping (path = "", method = RequestMethod.GET)
    public List<Card> getAllCards() {
        return cardDao.getAllCards();
    }

    @RequestMapping(path = "/{collectionId}", method = RequestMethod.POST)
    public void AddAllCards(@RequestBody List<Card> cards, @PathVariable int collectionId) {
        cardDao.addCards(cards, collectionId);
    }
}
