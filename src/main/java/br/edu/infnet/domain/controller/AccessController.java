package br.edu.infnet.domain.controller;

import br.edu.infnet.domain.model.User;
import br.edu.infnet.domain.service.CandidateJobService;
import br.edu.infnet.domain.service.JobService;
import br.edu.infnet.domain.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@SessionAttributes("user")
@Controller
public class AccessController {

    private final UserService userService = new UserService();
    private final JobService jobService = new JobService();
    private final CandidateJobService candidateJobService = new CandidateJobService();

    @GetMapping(value = "/")
    public String homePage() {
        return "/access/index";
    }

    @GetMapping(value = "/login")
    public String loginForm() {
        return "/access/login";
    }

    @GetMapping(value = "/company/home/{id}")
    public ModelAndView companyHome(@PathVariable String id) {
        List jobs = jobService.listByUserId(Integer.parseInt(id));
        ModelAndView response = new ModelAndView("/company/home");
        response.addObject("jobs", jobs);

        return response;
    }

    @PostMapping(value = "/access/login")
    public String login(Model model, @RequestParam String email, @RequestParam String password) {
        User user = userService.getByEmail(email);

        if (user != null && email.equals(user.getEmail()) && password.equals(user.getPassword())) {
            model.addAttribute("user", user);
            String inbox = null;

            if (user.getType() == User.COMPANY) {
                JobService jobService = new JobService();
                List jobs = jobService.listByUserId(user.getId());
                model.addAttribute("jobs", jobs);
                inbox = "/company/home";

            } else if (user.getType() == User.CANDIDATE) {
                List jobs = jobService.listJobs();
                model.addAttribute("jobs", jobs);
                Integer candidateId = user.getId();
                List applications = candidateJobService.listByCandidateId(candidateId);
                model.addAttribute("applications", applications);
                inbox = "/candidate/home";

            } else {
                List users = userService.listUsers();
                model.addAttribute("users", users);
                List jobs = jobService.listJobs();
                model.addAttribute("jobs", jobs);
                inbox = "/admin/home";

            }

            return inbox;
        } else {
            model.addAttribute("message", "Invalid authentication for user " + email);
        }

        return "/access/login";
    }

    @GetMapping(value = "/logout")
    public String logout(HttpSession session, SessionStatus status) {
        status.setComplete();
        session.removeAttribute("user");

        return "redirect:/";
    }
}
