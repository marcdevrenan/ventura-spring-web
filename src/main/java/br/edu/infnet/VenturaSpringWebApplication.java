package br.edu.infnet;

import br.edu.infnet.domain.controller.AccessController;
import br.edu.infnet.domain.controller.UserController;
import br.edu.infnet.domain.service.JobService;
import br.edu.infnet.domain.service.UserService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackageClasses = {AccessController.class, UserController.class, JobService.class, UserService.class})
public class VenturaSpringWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(VenturaSpringWebApplication.class, args);
    }

}
