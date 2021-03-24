package burgers_api.models;

import javax.persistence.*;

@Entity
@IdClass(BurgerIdSauceId.class)
@Table(name = "burgers_nuts")
public class BurgersSauces {
    @Id
    private Long burger_id;

    @Id
    private Integer sauce_id;
}
