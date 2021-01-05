package com.preclaim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/profile")
public class profileController {

    @RequestMapping(value = "/edit_profile", method = RequestMethod.GET)
    public String index() {
        return "profile/edit_profile";
    }    
}
