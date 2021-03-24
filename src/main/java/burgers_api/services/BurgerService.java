package burgers_api.services;

import burgers_api.dtos.BurgerDto;
import burgers_api.models.Burgers;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface BurgerService {
    Burgers createBurger(Burgers burgers);

    Page<Burgers> getBurgers(BurgerDto burgerDto, Pageable pageable);

    Optional<Burgers> findById(Long id);

    Optional<Burgers> findByRandomId();
}
