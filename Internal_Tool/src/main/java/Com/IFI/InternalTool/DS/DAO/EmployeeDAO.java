package Com.IFI.InternalTool.DS.DAO;

import org.springframework.stereotype.Repository;
import java.util.List;

import Com.IFI.InternalTool.DS.Model.Employee;

@Repository
public interface EmployeeDAO {
	// get list employess and paginations
	List<Employee> getAllEmployees(final boolean hasRoleEmployee, final long employee_id, final int page,
			final int pageSize);

	// save employees
	public Boolean saveEmployee(final Employee employee);

	// delete Employess
	public Boolean deleteEmployee(final long employee_id);

	// get employeess by ID
	public Employee getEmployeeById(final long employee_id);

	//
	public List<Long> getEmployeeByManager(final long manager_id);

	// find Employess with Name Like
	public List<Employee> findEmployeeNameLike(final String name, int page, int pageSize);

	// find employess by groups id
	public List<Employee> findEmployeeByGroupId(final String group_id, final int page, final int pageSize);

	List<Employee> getListSubEmployees(long employee_id);

	// tim kiem danh sanh nhan vien duoc phan cong vao 1 project
	List<Employee> getListEmployeeInProject(long project_id, int page, int pageSize);

	List<Employee> getListEmployeeNotInProject(final long employee_id, long project_id, int page, int pageSize);




}
