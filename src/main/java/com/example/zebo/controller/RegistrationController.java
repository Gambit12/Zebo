package com.example.zebo.controller;

import com.example.zebo.domain.Role;
import com.example.zebo.domain.User;
import com.example.zebo.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registration () {
        return "registration";   //turns back the View
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userfromDb = userRepo.findByUsername(user.getUsername());

        if(userfromDb != null) {
            model.put("message", "User exists!");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);
        return "redirect:/login";
    }
}
