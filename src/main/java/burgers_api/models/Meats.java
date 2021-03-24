package burgers_api.models;

import com.sun.istack.NotNull;

import javax.persistence.*;

@Entity
@Table(name = "meats")
public class Meats {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name = "id")
    private Long meat_id;

    @Column(unique = true)
    @NotNull
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
