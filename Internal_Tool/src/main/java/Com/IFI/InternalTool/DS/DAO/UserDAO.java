package Com.IFI.InternalTool.DS.DAO;

import Com.IFI.InternalTool.DS.Model.Employee;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface UserDAO extends JpaRepository<Employee, Long> {
	
	Optional<Employee> findById(Long employee_id);
	
	Optional<Employee> findByEmail(String email);

	Optional<Employee> findByUsernameOrEmail(String username, String email);

	Optional<Employee> findByUsername(String username);

	Boolean existsByUsername(String username);

	Boolean existsByEmail(String email);
}
