package com.preclaim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/mapping")
public class mappingController {

    @RequestMapping(value = "/add_mapping", method = RequestMethod.GET)
    public String add_mapping() {
        return "mapping/add_mapping";
    }    
    
    @RequestMapping(value = "/mapping_list", method = RequestMethod.GET)
    public String mapping_list() {
        return "mapping/mapping_list";
    }    
}
