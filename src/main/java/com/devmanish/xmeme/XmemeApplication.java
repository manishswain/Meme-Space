package com.devmanish.xmeme;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(value = "com.devmanish.xmeme")
public class XmemeApplication {

	public static void main(String[] args) {
		SpringApplication.run(XmemeApplication.class, args);
	}

}
