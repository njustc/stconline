package com.example.stc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    @GetMapping("/index")
    public String g() {
        return "index";
    }
    @GetMapping("basic-list")
    public String basicList(){
        return "index";
    }
}
