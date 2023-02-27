package com.techelevator.controller;

import com.techelevator.dao.CollectionDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Card;
import com.techelevator.model.CardCollection;
import com.techelevator.model.NewCollectionDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RequestMapping(path = "/collections")
@RestController
@CrossOrigin
public class CollectionController {
    private final CollectionDao collectionDao;

    public CollectionController(CollectionDao collectionDao) {
        this.collectionDao = collectionDao;
    }

    @RequestMapping(path = "", method = RequestMethod.GET)
    public List<CardCollection> getCardCollections(Principal principal) {
        String username;
        if (principal == null) {
            username = "";
        } else {
            username = principal.getName();
        }
        return collectionDao.getCardCollections(username);
    }

    @RequestMapping(path = "/user-collections/{id}", method = RequestMethod.GET)
    public List<CardCollection> getUserCardCollections(Principal principal, @PathVariable int id) {
        return collectionDao.getUserCardCollections(id);
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Object getCollectionById(Principal principal, @PathVariable int id) {
        String username;
        if (principal == null) {
            username = "";
        } else {
            username = principal.getName();
        }
        CardCollection cardCollection = collectionDao.getCardCollectionById(id, username);
        if (cardCollection == null) {
            return new ResponseEntity<String>("The collection you are trying to view either does not exist or is private.", HttpStatus.FORBIDDEN);
        } else {
            return cardCollection;
        }
    }

    @RequestMapping(path = "/{collectionId}/privacy", method = RequestMethod.PUT)
    public ResponseEntity<String> toggleCollectionPrivacyStatus(Principal principal, @PathVariable int collectionId, @RequestBody CardCollection collection) {
        String username;
        if (principal == null) {
            return new ResponseEntity<String>("This is not your collection.", HttpStatus.FORBIDDEN);
        } else {
            username = principal.getName();
        }
        boolean changed = collectionDao.toggleCollectionPrivacyStatus(collectionId, username, collection.isPrivate());
        if (changed) {
            return new ResponseEntity<String>("Privacy toggled.", HttpStatus.OK);
        } else {
            return new ResponseEntity<String>("Unsuccessful.", HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.PUT)
    public void updateCollectionDetails(Principal principal, @PathVariable int id, @RequestBody CardCollection collection) {
        collectionDao.updateCollection(principal.getName(), id, collection);
    }

    @RequestMapping(path = "/{collectionId}/quantity", method = RequestMethod.PUT)
    public void updateCollectionQuantity(@PathVariable int collectionId, @RequestBody Card card) {
        collectionDao.updateCollectionQuantity(collectionId, card.getId(), card.getQuantity());
    }

    @RequestMapping(method = RequestMethod.POST)
    public void createNewCollection(Principal principal, @RequestBody NewCollectionDTO newCollection) {
        collectionDao.createNewCollection(newCollection);
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.POST)
    public void addCardToCollection(Principal principal, @PathVariable int id, Card card) {
        collectionDao.addCardToCollection(id, card);
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.DELETE)
    public void deleteCollection(Principal principal, @PathVariable int id) {
        collectionDao.deleteCollection(id, principal.getName());
    }

    @RequestMapping(path = "/{collectionId}/{cardId}", method = RequestMethod.DELETE)
    public void deleteCardFromCollection(@PathVariable int collectionId, @PathVariable String cardId) {
        collectionDao.deleteCardFromCollection(collectionId, cardId);
    }

    @RequestMapping(path = "/{userId}/getAllCards", method = RequestMethod.GET)
    public List<Card> getAllCardsForGivenUser(@PathVariable int userId) {
        return collectionDao.getAllCardsForGivenUser(userId);
    }
}
