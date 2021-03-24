package burgers_api.services;

import burgers_api.dtos.BurgerDto;
import burgers_api.models.Burgers;

import burgers_api.repositories.BurgerRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class BurgerServiceImpl implements BurgerService {
    private final BurgerRepository burgerRepository;

    @Autowired
    public BurgerServiceImpl(BurgerRepository burgerRepository) {
        this.burgerRepository = burgerRepository;
    }

    public Burgers createBurger(Burgers burger) {
        burgerRepository.saveAndFlush(burger);
        return burger;
    }

    public Page<Burgers> getBurgers(BurgerDto burgerDto, Pageable pageable) {
        Burgers burger = new Burgers();

        if (burgerDto.getName() != null) {
            burger.setName(burgerDto.getName().replace("_", " "));
        }

        if (burgerDto.getIs_vegan() != null) {
            burger.setIs_vegan(burgerDto.getIs_vegan());
        }

        if (burgerDto.getIs_vegetarian() != null) {
            burger.setIs_vegetarian(burgerDto.getIs_vegetarian());
        }

        if (burgerDto.getPrice() != null) {
            burger.setPrice(burgerDto.getPrice());
        }

        if (burgerDto.getCalories() != null) {
            burger.setCalories(burgerDto.getCalories());
        }

        if (burgerDto.getWeight() != null) {
            burger.setWeight(burgerDto.getWeight());
        }

        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("name",  new ExampleMatcher.GenericPropertyMatcher().contains())
                .withMatcher("is_vegan",  new ExampleMatcher.GenericPropertyMatcher().exact())
                .withMatcher("is_vegetarian",  new ExampleMatcher.GenericPropertyMatcher().exact())
                .withMatcher("price", new ExampleMatcher.GenericPropertyMatcher().exact())
                .withMatcher("calories", new ExampleMatcher.GenericPropertyMatcher().exact())
                .withMatcher("weight", new ExampleMatcher.GenericPropertyMatcher().exact());

        Example<Burgers> example = Example.of(burger, matcher);
        return burgerRepository.findAll(example, pageable);
    }

    public Optional<Burgers> findById(Long id) {
        return burgerRepository.findById(id);
    }

    public Optional<Burgers> findByRandomId() {
        long qty = burgerRepository.count();
        return burgerRepository.findById((long)(Math.random() * qty));
    }
}
