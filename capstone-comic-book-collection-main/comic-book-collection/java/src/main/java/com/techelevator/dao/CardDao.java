package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.CardSet;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.util.List;

public interface CardDao {
    List<Card> getAllCards();
    Card getCardById(int id);
    void addCards(List<Card> cards, int collectionId);
    Card mapRowToCard(SqlRowSet results);
    public CardSet mapRowToCardSet(SqlRowSet results);
}
