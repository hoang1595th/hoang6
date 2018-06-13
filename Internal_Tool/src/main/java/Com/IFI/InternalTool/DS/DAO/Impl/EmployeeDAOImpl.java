  package Com.IFI.InternalTool.DS.DAO.Impl;

import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Com.IFI.InternalTool.DS.DAO.EmployeeDAO;
import Com.IFI.InternalTool.DS.DAO.RoleDAO;
import Com.IFI.InternalTool.DS.Model.Employee;
import Com.IFI.InternalTool.DS.Model.Types;
import Com.IFI.InternalTool.Utils.AppConstants;
import Com.IFI.InternalTool.Utils.Business;

@Repository("EmployeeDAO")
@Transactional
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	private EntityManagerFactory entityManagerFactory;
	@Autowired
	private ProjectMembersDAOImpl projectMembersDAO;
	@Override
	public List<Employee> getAllEmployees(final boolean hasRoleEmployee, final long employee_id, int page,
			int pageSize) {
		Employee emp = getEmployeeById(employee_id);
  
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "SELECT emp FROM Employee emp ";
		if (!hasRoleEmployee) {
			hql += " where emp.group_id = :group_id and emp.type_id = :type_id and emp.role_id > :role_id order by role_id ";
		}
		Query query = session.createQuery(hql);
		if (!hasRoleEmployee) {
			query.setParameter("group_id", emp.getGroup_id());
			query.setParameter("type_id", emp.getTypes().getType_id());
			query.setParameter("role_id", emp.getRole().getRole_id());
		}
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Employee> list = query.getResultList();
		session.close();
		return list;
	}

	// save or update
	@Override
	public Boolean saveEmployee(Employee employee) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		boolean success = false;
		try {
			session.saveOrUpdate(employee);
			success = true;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
		return success;

	}

	@Override
	public Boolean deleteEmployee(long employee_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		String hql = "Delete from Employee where employee_id=:employee_id";
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		int row = query.executeUpdate();
		tx.commit();
		session.close();
		if (row == 0) {
			return false;
		} else
			return true;
	}

	@Override 
	public Employee getEmployeeById(long employee_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "FROM Employee where employee_id=:employee_id";
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		Employee emp = (Employee) query.uniqueResult();
		session.close();
		return emp;
	}

	@Override
	public List<Long> getEmployeeByManager(long manager_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select distinct employee_id from Project_Manager where manager_id=:manager_id";
		Query query = session.createQuery(hql);
		query.setParameter("manager_id", manager_id);
		List<Long> list = query.list();
		session.close();
		return list;
	}

	@Override

	public List<Employee> findEmployeeNameLike(String name, int page, int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "SELECT emp FROM Employee emp where emp.fullname LIKE CONCAT('%', :name, '%')";
		Query query = session.createQuery(hql);
		query.setFirstResult((page - 1) * pageSize);
		query.setFetchSize(pageSize);
		query.setMaxResults(pageSize);
		List<Employee> list = query.getResultList();
		if (list.size() > pageSize) {
			return list = list.subList(0, pageSize);
		}
		session.close();
		return list;
	}

	@Override
	public List<Employee> findEmployeeByGroupId(final String group_id, final int page, final int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "FROM Employee where group_id=:group_id";
		Query query = session.createQuery(hql);
		query.setParameter("group_id", group_id);
		List<Employee> emp = query.getResultList();
		session.close();
		return emp;
	}

	@Override
	public List<Employee> getListEmployeeInProject(long project_id, int page, int pageSize) {
		List<Long> listEmployeesID = projectMembersDAO.listEmPloyeesIdInProject(project_id);
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "SELECT emp FROM  Employee emp where emp.employee_id in (:listEmployeesID) ";
		Query query = session.createQuery(hql);
		query.setParameter("project_id", project_id);
		query.setParameter("listEmployeesID", listEmployeesID);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Employee> emp = query.getResultList();
		session.close();
		return emp;
	}

	@Override
	public List<Employee> getListEmployeeNotInProject(final long employee_id, long project_id, int page, int pageSize) {
		List<Long> listEmployeesID = projectMembersDAO.listEmPloyeesIdInProject(project_id);
		Employee emp = getEmployeeById(employee_id);
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "FROM Employee where employee_id NOT IN (:listEmployeesID) "
				+ "and emp.group_id = :group_id and emp.type_id = :type_id "
				+ "and emp.role_id >= :role_id order by role_id\";";
		Query query = session.createQuery(hql);
		query.setParameter("group_id", emp.getGroup_id());
		query.setParameter("type_id", emp.getTypes().getType_id());
		query.setParameter("role_id", emp.getRole().getRole_id());
		query.setParameter("listEmployeesID", listEmployeesID);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Employee> list = query.getResultList();
		session.close();
		return list;
	}

	
	@Override
	public List<Employee> getListSubEmployees(long employee_id) {

		Employee emp = getEmployeeById(employee_id);
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "SELECT emp FROM  Employee emp where emp.role_id =:role_id and group_id = :group_id and type_id = ";
		if (AppConstants.FULL_STACK.equals(emp.getRole().getName())) {
			hql += AppConstants.BACK_END +  " or type_id = " + AppConstants.FRONT_END; 			
		}else {
			hql += ":type_id";
		}
		Query query = session.createQuery(hql);
		query.setParameter("role_id", emp.getRole_id()+1);
		query.setParameter("group_id", emp.getGroup_id());
		if (!AppConstants.FULL_STACK.equals(emp.getRole().getName())) {
			query.setParameter("type_id", emp.getType_id());			
		}		
		List<Employee> list = query.getResultList();
		session.close();
		return list;
	}

	

	

}
