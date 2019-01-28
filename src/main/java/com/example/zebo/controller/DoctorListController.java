package com.example.zebo.controller;

import com.example.zebo.domain.Role;
import com.example.zebo.domain.User;
import com.example.zebo.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/doctors")
public class DoctorListController {
    @Autowired
    private UserRepo userRepo;

    User user;

    @GetMapping
    public String doctorList(Model model) {

            model.addAttribute("doctors", userRepo.findAll());


        return "doctorList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "doctorEdit";
    }
}
