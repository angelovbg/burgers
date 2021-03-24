package burgers_api.controllers;

import burgers_api.models.Burgers;
import burgers_api.utils.ParamAndEntityBuilder;
import burgers_api.dtos.*;
import burgers_api.services.BurgerService;

import javax.validation.Valid;
import java.time.Duration;
import java.util.List;
import java.util.Optional;

import io.github.bucket4j.local.LocalBucket;
import org.springframework.beans.factory.annotation.Autowired;
import io.swagger.v3.oas.annotations.*;
import io.swagger.v3.oas.annotations.media.*;
import io.swagger.v3.oas.annotations.responses.*;
import org.springframework.data.domain.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import io.github.bucket4j.*;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@RestController
@RequestMapping(path = {"/v2/burgers"}, produces = APPLICATION_JSON_VALUE)
public class BurgerController {
    private final BurgerService burgerService;
    private ParamAndEntityBuilder paramAndEntityBuilder;
    private LocalBucket bucket;

    @Autowired
    public BurgerController(BurgerService burgerService, ParamAndEntityBuilder paramAndEntityBuilder) {
        this.burgerService = burgerService;
        this.paramAndEntityBuilder = paramAndEntityBuilder;

        Bandwidth limit = Bandwidth.classic(3600, Refill.greedy(3600, Duration.ofHours(1)));
        this.bucket = Bucket4j.builder()
                .addLimit(limit)
                .build();
    }


    @Operation(summary = "Add a new burger", description = "", tags = { "burger" })
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Burger created",
                    content = @Content(schema = @Schema(implementation = Burgers.class))),
            @ApiResponse(responseCode = "400", description = "Invalid input")})
    @CrossOrigin(origins = "*")
    @PostMapping(consumes = APPLICATION_JSON_VALUE, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<Burgers> createBurger(@Valid @RequestBody BurgerIncomingDto burgerIncomingDto) {
        if (this.bucket.tryConsume(1)) {
            final Burgers createdBurger = burgerService.createBurger(paramAndEntityBuilder.burgerParamToEntity(burgerIncomingDto));
            return ResponseEntity.status(HttpStatus.CREATED).body(createdBurger);
        }

        return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).build();
    }

    @Operation(summary = "Returns a list of burgers filtered based on the query parameters")
    @ApiResponse(responseCode = "200", description = "List of burgers", content = {@Content(mediaType = APPLICATION_JSON_VALUE, schema = @Schema(implementation = BurgerDto.class))})
    @CrossOrigin(origins = "*")
    @GetMapping
    public ResponseEntity<List<Burgers>> getBurgers(
            @RequestParam(required = false, name = "page", defaultValue = "0") int page,
            @RequestParam(required = false, name = "per_page", defaultValue = "25") int size,
            @RequestParam(required = false, name = "name") String name,
            @RequestParam(required = false, name = "is_vegan") Boolean is_vegan,
            @RequestParam(required = false, name = "is_vegetarian") Boolean is_vegetarian,
            @RequestParam(required = false, name = "price") Double price,
            @RequestParam(required = false, name = "calories") Integer calories,
            @RequestParam(required = false, name = "weight") Integer weight
//            @PageableDefault(value = 25) Pageable pageable
    ) {
        if (this.bucket.tryConsume(1)) {
            size = (size > 0) ? size : 25;
            Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Order.asc("id")));

            BurgerDto burgerDto = paramAndEntityBuilder.burgersDtoFromParams(name, price, is_vegan, is_vegetarian, calories, weight);
            final Page<Burgers> burgersPage = burgerService.getBurgers(burgerDto, pageable);

            return ResponseEntity.ok(burgersPage.getContent());
        }

        return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).build();
    }


    @Operation(summary = "Returns burgers model by id")
    @ApiResponse(responseCode = "200", description = "Burger model", content = {@Content(mediaType = APPLICATION_JSON_VALUE, schema = @Schema(implementation = BurgerDto.class))})
    @CrossOrigin(origins = "*")
    @GetMapping(value = "/{id}")
    public ResponseEntity<Optional<Burgers>> getBurgersById(@PathVariable Long id) {
        if (this.bucket.tryConsume(1)) {
            Optional<Burgers> burger = burgerService.findById(id);
            return ResponseEntity.ok(burger);
        }

        return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).build();
    }

    @Operation(summary = "Returns burgers model by random id")
    @ApiResponse(responseCode = "200", description = "Burger model by random id", content = {@Content(mediaType = APPLICATION_JSON_VALUE, schema = @Schema(implementation = BurgerDto.class))})
    @CrossOrigin(origins = "*")
    @GetMapping(value = "/random")
    public ResponseEntity<Optional<Burgers>> getBurgersByRandomId() {
        if (this.bucket.tryConsume(1)) {
            Optional<Burgers> burger = burgerService.findByRandomId();
            return ResponseEntity.ok(burger);
        }

        return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).build();
    }
}
