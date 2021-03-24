package burgers_api.models;

import javax.persistence.*;

@Entity
@IdClass(BurgerIdNutsId.class)
@Table(name = "burgers_nuts")
public class BurgersNuts {
    @Id
    private Long burger_id;

    @Id
    private Integer nut_id;
}
