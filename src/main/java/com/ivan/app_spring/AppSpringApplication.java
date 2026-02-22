package com.ivan.app_spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class AppSpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(AppSpringApplication.class, args);
	}

	@GetMapping("/")
	public String home() {
		return "Hello, World!";
	}
}
