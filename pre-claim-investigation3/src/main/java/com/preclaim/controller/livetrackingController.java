package com.preclaim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/livetracking")
public class livetrackingController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "livetracking/index";
    }    
}
