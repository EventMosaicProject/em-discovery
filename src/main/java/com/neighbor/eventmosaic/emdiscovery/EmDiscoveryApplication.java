package com.neighbor.eventmosaic.emdiscovery;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class EmDiscoveryApplication {

	public static void main(String[] args) {
		SpringApplication.run(EmDiscoveryApplication.class, args);
	}

}
