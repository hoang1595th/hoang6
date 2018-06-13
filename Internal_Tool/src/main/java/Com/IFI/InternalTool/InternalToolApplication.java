package Com.IFI.InternalTool;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters;

@SpringBootApplication
@EntityScan(basePackageClasses = {
		InternalToolApplication.class,
		Jsr310JpaConverters.class
})

public class InternalToolApplication {
	public static void main(String[] args) {
		SpringApplication.run(InternalToolApplication.class, args);
	}
}
