package br.edu.infnet.domain.controller;

import br.edu.infnet.domain.model.CandidateJob;
import br.edu.infnet.domain.model.Job;
import br.edu.infnet.domain.model.Requirement;
import br.edu.infnet.domain.model.User;
import br.edu.infnet.domain.service.CandidateJobService;
import br.edu.infnet.domain.service.JobService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class JobController {

    private final JobService jobService = new JobService();
    private final CandidateJobService candidateJobService = new CandidateJobService();

    @GetMapping(value = "/candidate/home/")
    public String getJobList(Model model) {
        List jobs = jobService.listJobs();
        model.addAttribute("jobs", jobs);

        Integer candidateId = ((CandidateJob) model.getAttribute("candidateJob")).getCandidateId();
        List applications = candidateJobService.listByCandidateId(candidateId);
        model.addAttribute("applications", applications);

        return "/candidate/home";
    }

    @GetMapping(value = "/create")
    public String postJob() {
        //model.addAttribute("job", null);
        return "/company/postJob";
    }

    @PostMapping(value = "/company/postJob")
    public ModelAndView postJob(Job job, HttpServletRequest request) {
        ModelAndView response = new ModelAndView("/company/postJob");
        HttpSession session = request.getSession();
        session.setAttribute("job", job);

        return response;
    }

    @PostMapping(value = "/company/postRequirement")
    public ModelAndView postRequirement(Requirement requirement, HttpServletRequest request) {
        ModelAndView response = new ModelAndView("/company/postJob");
        HttpSession session = request.getSession();
        List requirements = (List) session.getAttribute("requirements");
        if (requirements == null) {
            requirements = new ArrayList<>();
        }
        requirements.add(requirement);
        session.setAttribute("requirements", requirements);

        return response;
    }

    @PostMapping(value = "/company/post")
    public String post(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Job job = (Job) session.getAttribute("job");
        List requirements = (List) session.getAttribute("requirements");
        job.setRequirementList(requirements);
        jobService.postJob(job);
        session.removeAttribute("job");
        session.removeAttribute("requirements");
        return "redirect:/company/home/" + user.getId();
    }
}
