package br.edu.infnet.domain.service;

import br.edu.infnet.domain.model.CandidateJob;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import java.util.List;

public class CandidateJobService {

    private final String REST_URI = "http://localhost:8083/candidateJob";
    private final Client client = ClientBuilder.newClient();

    public List listByCandidateId(Integer candidateId) {
        return client
                .target(REST_URI)
                .path("applications")
                .path(String.valueOf(candidateId))
                .request(MediaType.APPLICATION_JSON)
                .get(List.class);
    }

    public CandidateJob applyJob(CandidateJob candidateJob) {
        return client.target(REST_URI)
                .request(MediaType.APPLICATION_JSON)
                .post(Entity.entity(candidateJob, MediaType.APPLICATION_JSON), CandidateJob.class);
    }
}
