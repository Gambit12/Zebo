package com.example.zebo.controller;

import com.example.zebo.domain.Message;
import com.example.zebo.domain.Role;
import com.example.zebo.domain.User;
import com.example.zebo.repos.MessageRepo;
import com.example.zebo.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/patientList")
@PreAuthorize("hasAuthority('DOCTOR')")
public class PatientListController {

    @Autowired
    private MessageRepo messageRepo;



    @Value("${upload.path}")
    private String uploadPath;

//    @GetMapping("/")
//    public String greeting(Map<String, Object> model)
//    {
//        return "calendar"; //greeting
//    }

    @GetMapping("/")
    public String main(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false, defaultValue = "") String filter, Model model
    ) {
        Iterable<Message> messages = messageRepo.findAll();

        System.out.println("The user is: " + user.getUsername());

        messages = messageRepo.findByTag(user.getUsername());  // here it is!!!

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "patientList";
    }

    @PostMapping("/patientList")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Map<String, Object> model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        Message message = new Message(text, tag, user);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
        }

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "patientList";
    }
}
