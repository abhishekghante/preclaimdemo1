package com.preclaim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/report")
public class reportController {

    @RequestMapping(value = "/favourite_message", method = RequestMethod.GET)
    public String favourite_message() {
        return "report/favourite_message";
    }
        
    @RequestMapping(value = "/like_message", method = RequestMethod.GET)
    public String like_message() {
        return "report/like_message";
    }
    
    @RequestMapping(value = "/login_details", method = RequestMethod.GET)
    public String login_details() {
        return "report/login_details";
    }
    
    @RequestMapping(value = "/messages_status", method = RequestMethod.GET)
    public String messages_status() {
        return "report/messages_status";
    }
    
    @RequestMapping(value = "/read_message", method = RequestMethod.GET)
    public String read_message() {
        return "report/read_message";
    }
    
    @RequestMapping(value = "/view_rating", method = RequestMethod.GET)
    public String view_rating() {
        return "report/view_rating";
    }
    
}
