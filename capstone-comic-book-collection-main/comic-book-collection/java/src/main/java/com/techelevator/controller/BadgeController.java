package com.techelevator.controller;


import com.techelevator.dao.BadgeDao;
import com.techelevator.model.Badge;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping(path = "/badges")
@RestController
@CrossOrigin
public class BadgeController {

    private final BadgeDao badgeDao;

    public BadgeController (BadgeDao badgedao) {
        this.badgeDao = badgedao;
    }

    @RequestMapping (path = "/{id}", method = RequestMethod.GET)
    public List<String> getUserBadges (@PathVariable int id) {
        return badgeDao.getUserBadges(id);
    }


    @RequestMapping (path = "/give/{id}", method = RequestMethod.GET)
    public List<String> getGivableBadges (@PathVariable int id){
       return badgeDao.getGivableBadges(id);
    }

    @RequestMapping (path = "/give/{toUserId}/{fromUserId}", method = RequestMethod.POST)
    public void giveUserBadge(@PathVariable String toUserId, @PathVariable int fromUserId, @RequestBody Badge badge){
        badgeDao.giveUserBadge(Integer.parseInt(toUserId), fromUserId, badge.getBadgeName());
    }
}
