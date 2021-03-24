package burgers_api.utils;

import burgers_api.dtos.*;
import burgers_api.models.Burgers;
import org.springframework.stereotype.Component;

@Component
public class ParamAndEntityBuilder {
    public Burgers burgerParamToEntity(BurgerIncomingDto param) {
        Burgers entity = new Burgers();
        entity.setName(param.getName());

        return entity;
    }

    public BurgerDto burgersDtoFromParams(String name, Double price, Boolean is_vegan, Boolean is_vegetarian, Integer calories, Integer weight) {
        BurgerDto burgerDto = new BurgerDto();
        burgerDto.setName(name);
        burgerDto.setPrice(price);
        burgerDto.setIs_vegan(is_vegan);
        burgerDto.setIs_vegetarian(is_vegetarian);
        burgerDto.setCalories(calories);
        burgerDto.setWeight(weight);

        return burgerDto;
    }
}
