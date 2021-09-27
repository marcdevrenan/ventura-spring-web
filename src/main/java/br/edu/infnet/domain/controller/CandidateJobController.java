package br.edu.infnet.domain.controller;

import br.edu.infnet.domain.model.CandidateJob;
import br.edu.infnet.domain.service.CandidateJobService;
import br.edu.infnet.domain.service.JobService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class CandidateJobController {

    private final CandidateJobService candidateJobService = new CandidateJobService();

    @GetMapping(value = "/candidate/home")
    public String candidateHome(Model model) {
        JobService jobService = new JobService();
        List jobs = jobService.listJobs();
        model.addAttribute("jobs", jobs);

        Integer candidateId = ((CandidateJob) model.getAttribute("candidateJob")).getCandidateId();
        List applications = candidateJobService.listByCandidateId(candidateId);
        model.addAttribute("applications", applications);

        return "/candidate/home";
    }

    @PostMapping(value = "/candidateJob/applyJob")
    public String applyJob(Model model, CandidateJob candidateJob) {
        candidateJobService.applyJob(candidateJob);
        model.addAttribute("message", "Congratulations! You have just applied for " + candidateJob.getRole() + " job.");

        return candidateHome(model);
    }
}
