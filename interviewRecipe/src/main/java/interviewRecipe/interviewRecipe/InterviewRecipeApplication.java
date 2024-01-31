package interviewRecipe.interviewRecipe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class InterviewRecipeApplication {
	public static void main(String[] args) {
		SpringApplication.run(InterviewRecipeApplication.class, args);
	}

}
