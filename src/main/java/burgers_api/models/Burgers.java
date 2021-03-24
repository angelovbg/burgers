package burgers_api.models;

import com.sun.istack.NotNull;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "burgers")
public class Burgers {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(unique = true)
    @NotNull
    @Size(min = 2, max = 255)
    private String name;

    @Column
    private Double price;

    @Column
    private Integer calories;

    @Column
    private Integer weight;

    @Column(nullable=true)
    Integer bun_id;

    @ManyToOne(optional = true)
    @MapsId("id")
    @JoinColumn(name = "bun_id")
    Buns bun;

    @ManyToMany
    @JoinTable(
            name = "burgers_meats",
            joinColumns = @JoinColumn(name = "burger_id"),
            inverseJoinColumns = @JoinColumn(name = "meat_id"))
    Set<Meats> meats;

    @ManyToMany
    @JoinTable(
            name = "burgers_sauces",
            joinColumns = @JoinColumn(name = "burger_id"),
            inverseJoinColumns = @JoinColumn(name = "sauce_id"))
    Set<Sauces> sauces;

    @ManyToMany
    @JoinTable(
            name = "burgers_nuts",
            joinColumns = @JoinColumn(name = "burger_id"),
            inverseJoinColumns = @JoinColumn(name = "nut_id"))
    Set<Nuts> nuts;

    @ManyToMany
    @JoinTable(
            name = "burgers_ingredients",
            joinColumns = @JoinColumn(name = "burger_id"),
            inverseJoinColumns = @JoinColumn(name = "ingredient_id"))
    Set<Ingredients> ingredients;

    @Column(columnDefinition="tinyint(1) default 0")
    private Boolean is_vegan;

    @Column(columnDefinition="tinyint(1) default 0")
    private Boolean is_vegetarian;

    @Column
    private String image_url;

    public Burgers() {

    }

    public Burgers(String name) {
        this.setName(name);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCalories() {
        return calories;
    }

    public void setCalories(Integer calories) {
        this.calories = calories;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Buns getBun() {
        return bun;
    }

    public void setBun(Buns bun) {
        this.bun = bun;
    }

    public Set<Meats> getMeats() {
        return meats;
    }

    public void setMeats(Set<Meats> meats) {
        this.meats = meats;
    }

    public Set<Sauces> getSauces() {
        return sauces;
    }

    public void setSauces(Set<Sauces> sauces) {
        this.sauces = sauces;
    }

    public Set<Nuts> getNuts() {
        return nuts;
    }

    public void setNuts(Set<Nuts> nuts) {
        this.nuts = nuts;
    }

    public Set<Ingredients> getIngredients() {
        return ingredients;
    }

    public void setIngredients(Set<Ingredients> ingredients) {
        this.ingredients = ingredients;
    }

    public Boolean isIs_vegan() {
        return is_vegan;
    }

    public void setIs_vegan(Boolean is_vegan) {
        this.is_vegan = is_vegan;
    }

    public Boolean isIs_vegetarian() {
        return is_vegetarian;
    }

    public void setIs_vegetarian(Boolean is_vegetarian) {
        this.is_vegetarian = is_vegetarian;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    @Override
    public String toString() {
        return "id -> " + this.id + " name -> " + this.name + " price -> " + this.price + " is_vegan -> " + this.is_vegan + " is_vegetarian -> " + this.is_vegetarian +
               " weight -> " + this.weight + " calories -> " + this.calories + " image_url -> " + this.image_url ;
    }
}