package Com.IFI.InternalTool.BS.Service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import Com.IFI.InternalTool.DS.Model.Employee;

public interface EmployeeService {
	// get list employeess and paginations
	public List<Employee> getAllEmployees(final boolean hasRoleEmPloyee, final long employee_id, final int page,
			final int pageSize);

	// save employess
	public Boolean saveEmployee(final Employee employee);

	// delete employees by id
	@PreAuthorize("hasRole('ADMIN')")
	public Boolean deleteEmployee(final long employee_id);

	// get employss by ID
	public Employee getEmployeeById(final long employee_id);

	// find Employees Name Like
	public List<Employee> findEmployeeNameLike(final String name, int page, int pageSize);

	// find Employees By Group ID
	public List<Employee> findEmployeeByGroupId(final String group_id, final int page, final int pageSize);

	// tim kiem danh sanh nhan vien duoc phan cong vao 1 project
	List<Employee> getListEmployeeInProject(long project_id, int page, int pageSize);

	// tim kiem danh sanh nhan vien chua duoc phan cong vao 1 project
	List<Employee> getListEmployeeNotInProject(final long employee_id, long project_id, int page, int pageSize);

	public List<Long> getEmployeeByManager(final long manager_id);

	Long getEmployeeIdAuthenticated();

	// lay danh sach nhan vien cap duoi
	List<Employee> getListSubEmployee(final long employee_id);

}
