package br.edu.infnet.domain.controller;

import br.edu.infnet.domain.model.User;
import br.edu.infnet.domain.service.JobService;
import br.edu.infnet.domain.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class UserController {

    private final UserService userService = new UserService();

    @GetMapping(value = "/user")
    public String createUser() {
        return "/user/create";
    }

    @PostMapping(value = "/user/create")
    public String create(Model model, User user) {
        userService.createAccount(user);
        model.addAttribute("user", user);
        String inbox = null;

        if (user.getType() == User.COMPANY) {
//            JobService jobService = new JobService();
//            List jobs = jobService.listByUserId(user.getId());
//            model.addAttribute("jobs", jobs);
            inbox = "redirect:/login";

        } else if (user.getType() == User.CANDIDATE) {
//            JobService jobService = new JobService();
//            List jobs = jobService.listJobs();
//            model.addAttribute("jobs", jobs);
            inbox = "redirect:/login";

        } else {
            List users = userService.listUsers();
//            model.addAttribute("users", users);
//            JobService jobService = new JobService();
//            List jobs = jobService.listJobs();
//            model.addAttribute("jobs", jobs);
            inbox = "redirect:/login";
        }

        return inbox;
    }
}
