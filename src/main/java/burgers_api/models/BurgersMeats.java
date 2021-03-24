package burgers_api.models;

import javax.persistence.*;

@Entity
@IdClass(BurgerIdMeatId.class)
@Table(name = "burgers_meats")
public class BurgersMeats {
    @Id
    private Long burger_id;

    @Id
    private Long meat_id;
}
