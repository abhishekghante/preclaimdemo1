package com.preclaim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/region")
public class regionController {

    @RequestMapping(value = "/active_region", method = RequestMethod.GET)
    public String active_region() {
        return "region/active_region";
    }    
    
    @RequestMapping(value = "/add_region", method = RequestMethod.GET)
    public String add_region() {
        return "region/add_regionn";
    }    
    
    @RequestMapping(value = "/edit_region", method = RequestMethod.GET)
    public String edit_region() {
        return "region/edit_region";
    }    
    
    @RequestMapping(value = "/pending_region", method = RequestMethod.GET)
    public String pending_region() {
        return "region/pending_region";
    }
}
