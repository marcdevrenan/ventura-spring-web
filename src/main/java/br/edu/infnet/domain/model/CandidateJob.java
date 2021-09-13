package br.edu.infnet.domain.model;

import java.util.HashMap;

public class CandidateJob {

    private Integer id;
    private String email;
    private Integer candidateId;
    private Integer jobId;
    private String role;
    private String city;
    private HashMap<String, Integer> descriptionProfile;

    public CandidateJob() {
    }

    @Override
    public String toString() {
        return "CandidateJob{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", candidateId=" + candidateId +
                ", jobId=" + jobId +
                ", role='" + role + '\'' +
                ", city='" + city + '\'' +
                ", descriptionProfile=" + descriptionProfile +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(Integer candidateId) {
        this.candidateId = candidateId;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public HashMap<String, Integer> getDescriptionProfile() {
        return descriptionProfile;
    }

    public void setDescriptionProfile(HashMap<String, Integer> descriptionProfile) {
        this.descriptionProfile = descriptionProfile;
    }
}
