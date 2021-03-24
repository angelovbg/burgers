package burgers_api.dtos;

import javax.validation.constraints.*;

public class BurgerIncomingDto {
    @NotEmpty(message = "'${validatedValue}' property is required")
    @Size(min = 2, max = 255, message = "The '${validatedValue}' must be between {min} and {max} characters long")
    private String name;

    private Double price;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
