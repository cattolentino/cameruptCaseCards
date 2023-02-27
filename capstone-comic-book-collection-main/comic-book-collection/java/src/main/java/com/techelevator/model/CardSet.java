package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonAlias;

public class CardSet {
    private String id;
    private String name;
    private String series;
    private int printedTotal;
    private CardSetImages images;

    public CardSet(String id, String name, String series, int printedTotal, CardSetImages images) {
        this.id = id;
        this.name = name;
        this.series = series;
        this.printedTotal = printedTotal;
        this.images = images;
    }

    public CardSet() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSeries() {
        return series;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public int getPrintedTotal() {
        return printedTotal;
    }

    public void setPrintedTotal(int printedTotal) {
        this.printedTotal = printedTotal;
    }

    public CardSetImages getImages() {
        return images;
    }

    public void setImages(CardSetImages images) {
        this.images = images;
    }
}
