package br.edu.infnet.domain.service;

import br.edu.infnet.domain.model.User;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import java.util.List;

public class UserService {

    private final String REST_URI = "http://localhost:8081/users";
    private final Client client = ClientBuilder.newClient();

    public List listUsers() {
        return client
                .target(REST_URI)
                .path("all-users")
                .request(MediaType.APPLICATION_JSON)
                .get(List.class);
    }

    public User getByEmail(String email) {
        return client
                .target(REST_URI)
                .path("email")
                .path(email)
                .request(MediaType.APPLICATION_JSON)
                .get(User.class);
    }

    public User getById(Integer id) {
        return client
                .target(REST_URI)
                .path("id")
                .path("" + id)
                .request(MediaType.APPLICATION_JSON)
                .get(User.class);
    }

    public User createAccount(User user) {
        return client.target(REST_URI)
                .request(MediaType.APPLICATION_JSON)
                .post(Entity.entity(user, MediaType.APPLICATION_JSON), User.class);
    }
}
