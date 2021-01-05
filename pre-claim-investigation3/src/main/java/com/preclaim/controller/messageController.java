package com.preclaim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/message")
public class messageController {

    @RequestMapping(value = "/active_message", method = RequestMethod.GET)
    public String active_message() {
        return "message/active_message";
    }
    
    @RequestMapping(value = "/add_message", method = RequestMethod.GET)
    public String add_message() {
        return "message/add_message";
    }
    
    @RequestMapping(value = "/assigned_message", method = RequestMethod.GET)
    public String assigned_message() {
        return "message/assigned_message";
    }
    
    @RequestMapping(value = "/edit_message", method = RequestMethod.GET)
    public String edit_message() {
        return "message/edit_message";
    }
    
    @RequestMapping(value = "/import_case", method = RequestMethod.GET)
    public String import_case() {
        return "message/import_case";
    }
    
    @RequestMapping(value = "/pending_message", method = RequestMethod.GET)
    public String pending_message() {
        return "message/pending_message";
    }
}
