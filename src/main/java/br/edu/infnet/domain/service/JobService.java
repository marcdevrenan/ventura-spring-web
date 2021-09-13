package br.edu.infnet.domain.service;

import br.edu.infnet.domain.model.Job;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import java.util.List;

public class JobService {

    private final String REST_URI = "http://localhost:8082/jobs";
    private final Client client = ClientBuilder.newClient();

    public List listJobs() {
        return client
                .target(REST_URI)
                .path("all-jobs")
                .request(MediaType.APPLICATION_JSON)
                .get(List.class);
    }

    public List listByUserId(Integer userId) {
        return client
                .target(REST_URI)
                .path("user")
                .path(String.valueOf(userId))
                .request(MediaType.APPLICATION_JSON)
                .get(List.class);
    }

    public Job postJob(Job job) {
        return client.target(REST_URI)
                .request(MediaType.APPLICATION_JSON)
                .post(Entity.entity(job, MediaType.APPLICATION_JSON), Job.class);
    }
}
