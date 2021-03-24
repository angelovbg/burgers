package burgers_api.dtos;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class BurgerDto {
    @NotEmpty (message = "name is required")
    @Size(min = 2, max = 255)
    private String name;

    private Integer calories;

    private Double price;

    private Integer weight;

    private Boolean is_vegan;

    private Boolean is_vegetarian;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCalories() {
        return calories;
    }

    public void setCalories(Integer calories) {
        this.calories = calories;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Boolean getIs_vegan() {
        return is_vegan;
    }

    public void setIs_vegan(Boolean is_vegan) {
        this.is_vegan = is_vegan;
    }

    public Boolean getIs_vegetarian() {
        return is_vegetarian;
    }

    public void setIs_vegetarian(Boolean is_vegetarian) {
        this.is_vegetarian = is_vegetarian;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }
}
