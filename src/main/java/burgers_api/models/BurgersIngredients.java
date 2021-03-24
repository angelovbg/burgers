package burgers_api.models;

import javax.persistence.*;

@Entity
@IdClass(BurgerIdIngredientId.class)
@Table(name = "burgers_ingredients")
public class BurgersIngredients {
    @Id
    private Long burger_id;

    @Id
    private Integer ingredient_id;
}
