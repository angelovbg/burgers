package burgers_api.repositories;

import burgers_api.models.Burgers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional(readOnly = true)
public interface BurgerRepository extends JpaRepository<Burgers, Long> {

}
