package Com.IFI.InternalTool.DS.DAO.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Com.IFI.InternalTool.DS.DAO.VacationDAO;
import Com.IFI.InternalTool.DS.Model.Vacation;
import Com.IFI.InternalTool.DS.Model.Vacation_Approved;
import Com.IFI.InternalTool.DS.Model.Vacation_Log;
import Com.IFI.InternalTool.DS.Model.Vacation_Type;
import Com.IFI.InternalTool.DS.Model.SearchModel.VacationSearch;

@Repository("VacationDAO")
@Transactional
public class VacationDAOImpl implements VacationDAO {
	@Autowired
	private EntityManagerFactory entityManagerFactory;

	// employee page
	@Override
	public List<Vacation> getAllVacationByEmp(long employee_id, int page, int pageSize, String sortedColumn,
			Boolean desc, Boolean is_approved, List<Integer> status) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "FROM Vacation v where v.employee_id=:employee_id and ((:is_approved IS NULL and v.is_approved IS NULL) or v.is_approved=:is_approved) and v.status in (:status) ";
		if (sortedColumn != null && desc != null) {
			String order = "";
			if (desc) {
				order = "desc";
			}
			hql += "ORDER BY " + sortedColumn + " " + order;
		}else {
			
			hql += " ORDER BY vacation_id" +  " desc";
		}
		Query query = session.createQuery(hql);
		query.setReadOnly(true);
		query.setParameter("employee_id", employee_id);
		query.setParameter("is_approved", is_approved);
		query.setParameterList("status", status);
		query.setFirstResult((page - 1) * pageSize);
		query.setFetchSize(pageSize);
		query.setMaxResults(pageSize);
		List<Vacation> list = query.list();
		session.close();
		return list;
	}

	// get all vacation to approve manage/leader page
	@Override
	public List<Vacation> getAllVacationByEmp2(long manager_id, int page, int pageSize, String sortedColumn,
			Boolean desc) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select v FROM Vacation v INNER JOIN Employee AS e ON v.employee_id= e.employee_id INNER JOIN Project AS p ON v.project_id=p.project_id INNER JOIN ProjectManager AS pm ON (v.employee_id=pm.employee_id and v.project_id=pm.project_id  and v.status=pm.priority)  where  pm.manager_id=:manager_id ";
		if (sortedColumn != null && desc != null) {
			String order = "";
			if (desc) {
				order = "desc";
			}
			hql += "ORDER BY " + sortedColumn + " " + order;
		}
		Query query = session.createQuery(hql);
		query.setParameter("manager_id", manager_id);
		query.setReadOnly(true);
		query.setFirstResult((page - 1) * pageSize);
		query.setFetchSize(pageSize);
		query.setMaxResults(pageSize);
		List<Vacation> list = query.list();
		if (list.size() > pageSize) {
			return list = list.subList(0, pageSize);
		}
		session.close();
		return list;
	}
	
	@Override
	public Long countAllVacationByEmp2(long manager_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select count(v) FROM Vacation v INNER JOIN Employee AS e ON v.employee_id= e.employee_id INNER JOIN Project AS p ON v.project_id=p.project_id INNER JOIN ProjectManager AS pm ON (v.employee_id=pm.employee_id and v.project_id=pm.project_id  and v.status=pm.priority)  where  pm.manager_id=:manager_id ";
		Query query = session.createQuery(hql);
		query.setParameter("manager_id", manager_id);
		query.setReadOnly(true);
		Long result=(Long) query.uniqueResult();
		session.close();
		return result;
	}
	
	@Override
	public boolean saveVacation(Vacation vacation) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		session.saveOrUpdate(vacation);
		session.close();
		tx.commit();
		return true;
	}

	@Override
	public boolean deleteVacation(long vacation_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		String hql = "Delete from Vacation where vacation_id=:vacation_id";
		Query query = session.createQuery(hql);
		query.setParameter("vacation_id", vacation_id);
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}

	@Override
	public Vacation getVacationById(long vacation_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "FROM Vacation where vacation_id=:vacation_id";
		Query query = session.createQuery(hql);
		query.setParameter("vacation_id", vacation_id);
		query.setReadOnly(true);
		Vacation v = (Vacation) query.uniqueResult();
		return v;
	}

	@Override
	public void saveVacationApproved(Vacation_Approved vacation_approved) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		session.saveOrUpdate(vacation_approved);
		session.close();
		tx.commit();
	}

	@Override
	public List<Vacation_Type> getAllVacationType() {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "from Vacation_Type";
		Query query = session.createQuery(hql);
		List<Vacation_Type> list = query.list();
		query.setReadOnly(true);
		session.close();
		return list;
	}

	// search manager/leader page
	@Override
	public List<Vacation> searchVacation(Long manager_id, int page, int pageSize, String sortedColumn, Boolean desc,
			VacationSearch vacationSearch) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select v from Vacation v INNER JOIN Employee AS e ON v.employee_id= e.employee_id INNER JOIN Project AS p ON v.project_id=p.project_id INNER JOIN ProjectManager pm ON (pm.employee_id=v.employee_id and pm.project_id=v.project_id and pm.priority=v.status) ";
		hql += "WHERE (:emp_name IS NULL OR e.fullname LIKE CONCAT('%', :emp_name, '%')) ";
		hql += "AND (:status =0 or v.status=:status) ";
		hql += "AND (:pro_name IS NULL OR p.name LIKE CONCAT('%', :pro_name, '%')) ";
		hql += "AND ((:from_date IS NULL and ( :to_date IS NOT NULL and (:to_date>= v.to_date) or (:to_date < v.to_date and :to_date>=v.from_date))) ";
		hql += "or (:to_date IS NULL and (:from_date IS NOT NULL and :from_date <= v.to_date)) ";
		hql += "or (:from_date >= v.from_date and :from_date <= v.to_date and :to_date >= v.from_date and :to_date <= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date <= v.from_date and :to_date >= v.from_date and :to_date <= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date >= v.from_date and :from_date <= v.to_date and :to_date >= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date <= v.from_date and :to_date >= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date IS NULL and :to_date IS NULL)) ";
		hql += "AND (pm.manager_id=:manager_id)";
		if (sortedColumn != null && desc != null) {
			String order = "";
			if (desc) {
				order = "desc";
			}
			hql += "ORDER BY " + sortedColumn + " " + order;
		}
		Query query = session.createQuery(hql);
		query.setParameter("manager_id", manager_id);
		query.setParameter("emp_name", vacationSearch.getEmp_name());
		query.setParameter("pro_name", vacationSearch.getPro_name());
		query.setParameter("from_date", vacationSearch.getFrom_date());
		query.setParameter("to_date", vacationSearch.getTo_date());
		query.setParameter("status", vacationSearch.getStatus());
		query.setReadOnly(true);
		query.setFirstResult((page - 1) * pageSize);
		query.setFetchSize(pageSize);
		query.setMaxResults(pageSize);
		List<Vacation> list = query.list();
		if (list.size() > pageSize) {
			return list = list.subList(0, pageSize);
		}
		session.close();
		return list;

	}

	// search employee page
	@Override
	public List<Vacation> searchVacationP2(Long employee_id, int page, int pageSize, String sortedColumn, Boolean desc,
			VacationSearch vacationSearch) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select v from Vacation v INNER JOIN Employee AS e ON v.employee_id= e.employee_id INNER JOIN Project AS p ON v.project_id=p.project_id ";
		hql += "WHERE (:pro_name IS NULL OR p.name LIKE CONCAT('%', :pro_name, '%')) ";
		hql += "AND (:status =0 or v.status=:status) ";
		hql += "AND ((:from_date IS NULL and ( :to_date IS NOT NULL and (:to_date >= v.to_date) or (:to_date<v.to_date and :to_date>=v.from_date))) ";
		hql += "or (:to_date IS NULL and (:from_date IS NOT NULL and :from_date <= v.to_date)) ";
		hql += "or (:from_date >= v.from_date and :from_date <= v.to_date and :to_date >= v.from_date and :to_date <= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date <= v.from_date and :to_date >= v.from_date and :to_date <= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date >= v.from_date and :from_date <= v.to_date and :to_date >= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date <= v.from_date and :to_date >= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date IS NULL and :to_date IS NULL)) ";
		hql += "AND (v.employee_id=:employee_id) ";
		if (sortedColumn != null && desc != null) {
			String order = "";
			if (desc) {
				order = "desc";
			}
			hql += "ORDER BY " + sortedColumn + " " + order;
		}
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		query.setParameter("pro_name", vacationSearch.getPro_name());
		query.setParameter("from_date", vacationSearch.getFrom_date());
		query.setParameter("to_date", vacationSearch.getTo_date());
		query.setParameter("status", vacationSearch.getStatus());
		query.setFirstResult((page - 1) * pageSize);
		query.setFetchSize(pageSize);
		query.setMaxResults(pageSize);
		query.setReadOnly(true);
		List<Vacation> list = query.list();
		if (list.size() > pageSize) {
			return list = list.subList(0, pageSize);
		}
		session.close();
		return list;

	}

	// get vacation's max priority
	@Override
	public int getMaxPriority(long vacation_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select MAX(t.priority) from Vacation_Approved t where vacation_id=:vacation_id";
		Query query = session.createQuery(hql);
		query.setParameter("vacation_id", vacation_id);
		int max = (int) query.uniqueResult();
		return max;
	}

	// get manager's priority
	@Override
	public int getPriority(long manager_id, long vacation_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select t.priority from Vacation_Approved t where manager_id=:manager_id and vacation_id=:vacation_id";
		Query query = session.createQuery(hql);
		query.setParameter("manager_id", manager_id);
		query.setParameter("vacation_id", vacation_id);
		int p = (int) query.uniqueResult();
		return p;
	}

	@Override
	public List<Long> getManagerByVacationId(long vacation_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select t.manager_id From Vacation_Approved t INNER JOIN Vacation AS v ON (t.vacation_id=v.vacation_id) where  t.vacation_id=:vacation_id ";
		Query query = session.createQuery(hql);
		query.setParameter("vacation_id", vacation_id);
		List<Long> list = query.list();
		session.close();
		return list;
	}

	@Override
	public boolean saveVacationLog(Vacation_Log vacation_log) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		session.saveOrUpdate(vacation_log);
		session.close();
		tx.commit();
		return true;
	}

	@Override
	public Vacation_Log getVacationLogByVacationIdAndNextApproveId(long vacation_id, long next_approve_id) {

		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "From Vacation_Log where vacation_id=:vacation_id and next_approve_id=:next_approve_id";
		Query query = session.createQuery(hql);
		query.setParameter("next_approve_id", next_approve_id);
		query.setParameter("vacation_id", vacation_id);
		Vacation_Log vl = (Vacation_Log) query.uniqueResult();
		session.close();
		return vl;
	}

	@Override
	public List<Long> getApprovedIdByVacationId(Long vacation_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select v.approved_id From Vacation_Log v where vacation_id=:vacation_id and v.approved_id>0";
		Query query = session.createQuery(hql);
		query.setParameter("vacation_id", vacation_id);
		List<Long> list = query.list();
		session.close();
		return list;
	}

	@Override
	public Long getDisApproveIdByVacationId(Long vacation_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select v.disapproved_id From Vacation_Log v where vacation_id=:vacation_id and v.disapproved_id>0";
		Query query = session.createQuery(hql);
		query.setParameter("vacation_id", vacation_id);
		Long a = (Long) query.uniqueResult();
		session.close();
		return a;
	}

	@Override
	public Long countAllVacationById(List<Integer> status, Boolean is_approved, Long emp_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Long total = 0L;
		for (Integer mystatus : status) {
			String hql = "SELECT count(e.vacation_id) FROM Vacation e WHERE e.employee_id = :emp_id and ((:is_approved IS NULL and e.is_approved IS NULL) or e.is_approved=:is_approved) and e.status=:mystatus";
			Query query = session.createQuery(hql);
			query.setParameter("emp_id", emp_id);
			query.setParameter("is_approved", is_approved);
			query.setParameter("mystatus", mystatus);
			Long count = (Long) query.uniqueResult();
			total = total + count;
		}
		session.close();
		return total;
	}
//emp page
	@Override
	public List<Long> countVacationByStatus(Long employee_id) {
		List<Long> result = new ArrayList<Long>();
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		// new
		String hql1 = "Select count(*) From Vacation v where v.employee_id=:employee_id and status=1 and is_approved IS NULL";
		Query query1 = session.createQuery(hql1);
		query1.setParameter("employee_id", employee_id);
		result.add((Long) query1.uniqueResult());
		// approving
		String hql2 = "Select count(*) From Vacation v where v.employee_id=:employee_id and status >= 1 and is_approved=false";
		Query query2 = session.createQuery(hql2);
		query2.setParameter("employee_id", employee_id);
		result.add((Long) query2.uniqueResult());
		// approved
		String hql3 = "Select count(*) From Vacation v where v.employee_id=:employee_id and status >= 1 and is_approved=true";
		Query query3 = session.createQuery(hql3);
		query3.setParameter("employee_id", employee_id);
		result.add((Long) query3.uniqueResult());
		// disapproved
		String hql4 = "Select count(*) From Vacation v where v.employee_id=:employee_id and status = -1 and is_approved=false";
		Query query4 = session.createQuery(hql4);
		query4.setParameter("employee_id", employee_id);
		result.add((Long) query4.uniqueResult());
		session.close();
		return result;
	}
//manager page
	@Override
	public List<Long> countVacationByStatusMng(Long manager_id) {
		List<Long> result = new ArrayList<Long>();
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		// need approve
		String hql1 = "Select count(v.next_approve_id) From Vacation_Log v where v.next_approve_id=:manager_id and v.approved_id=0 and v.disapproved_id=0";
		Query query1 = session.createQuery(hql1);
		query1.setParameter("manager_id", manager_id);
		result.add((Long) query1.uniqueResult());
		// approved
		String hql2 = "Select count(v.approved_id) From Vacation_Log v where v.approved_id=:manager_id";
		Query query2 = session.createQuery(hql2);
		query2.setParameter("manager_id", manager_id);
		result.add((Long) query2.uniqueResult());
		// disapproved
		String hql3 = "Select count(v.disapproved_id) From Vacation_Log v where v.disapproved_id=:manager_id";
		Query query3 = session.createQuery(hql3);
		query3.setParameter("manager_id", manager_id);
		result.add((Long) query3.uniqueResult());
		session.close();
		return result;
	}
//manager page
	@Override
	public List<Long> getApprovedIdVacationLogByMng(long manager_id,int page, int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
				String hql = "Select v.vacation_id From Vacation_Log v where v.approved_id=:manager_id ORDER BY v.vacation_log_id DESC";
				Query query = session.createQuery(hql);
				query.setParameter("manager_id", manager_id);
				query.setFetchSize(pageSize);
				query.setMaxResults(pageSize);
				List<Long> list = query.list();
				if (list.size() > pageSize) {
					return list = list.subList(0, pageSize);
				}
				session.close();
				return list;
	}

	@Override
	public List<Long> getDisapproveIdVacationLogByMng(long manager_id,int page, int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select v.vacation_id From Vacation_Log v where v.disapproved_id=:manager_id ORDER BY v.vacation_log_id DESC";
		Query query = session.createQuery(hql);
		query.setParameter("manager_id", manager_id);
		query.setFetchSize(pageSize);
		query.setMaxResults(pageSize);
		List<Long> list = query.list();
		if (list.size() > pageSize) {
			return list = list.subList(0, pageSize);
		}
		session.close();
		return list;
	}

	@Override
	public Vacation_Type getVacationTypeById(long vacation_type_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "From Vacation_Type vt where vt.vacation_type_id=:vacation_type_id";
		Query query = session.createQuery(hql);
		query.setParameter("vacation_type_id", vacation_type_id);
		Vacation_Type a=(Vacation_Type) query.uniqueResult();
		session.close();
		return a;
	}

	@Override
	public Long getManagerIdByEmpProAndStatus(long employee_id, long project_id, int status) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select pm.manager_id from ProjectManager pm where pm.employee_id=:employee_id and pm.project_id=:project_id and pm.priority=:status";
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		query.setParameter("project_id", project_id);
		query.setParameter("status", status);
		Long result=(Long) query.uniqueResult();
		session.close();
		return result;
	}

	@Override
	public Long CountSearchVacation(Long manager_id, VacationSearch vacationSearch) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select count(v) from Vacation v INNER JOIN Employee AS e ON v.employee_id= e.employee_id INNER JOIN Project AS p ON v.project_id=p.project_id INNER JOIN ProjectManager pm ON (pm.employee_id=v.employee_id and pm.project_id=v.project_id and pm.priority=v.status) ";
		hql += "WHERE (:emp_name IS NULL OR e.fullname LIKE CONCAT('%', :emp_name, '%')) ";
		hql += "AND (:status =0 or v.status=:status) ";
		hql += "AND (:pro_name IS NULL OR p.name LIKE CONCAT('%', :pro_name, '%')) ";
		hql += "AND ((:from_date IS NULL and ( :to_date IS NOT NULL and (:to_date>= v.to_date) or (:to_date < v.to_date and :to_date>=v.from_date))) ";
		hql += "or (:to_date IS NULL and (:from_date IS NOT NULL and :from_date <= v.to_date)) ";
		hql += "or (:from_date >= v.from_date and :from_date <= v.to_date and :to_date >= v.from_date and :to_date <= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date <= v.from_date and :to_date >= v.from_date and :to_date <= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date >= v.from_date and :from_date <= v.to_date and :to_date >= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date <= v.from_date and :to_date >= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date IS NULL and :to_date IS NULL)) ";
		hql += "AND (pm.manager_id=:manager_id)";
		Query query = session.createQuery(hql);
		query.setParameter("manager_id", manager_id);
		query.setParameter("emp_name", vacationSearch.getEmp_name());
		query.setParameter("pro_name", vacationSearch.getPro_name());
		query.setParameter("from_date", vacationSearch.getFrom_date());
		query.setParameter("to_date", vacationSearch.getTo_date());
		query.setParameter("status", vacationSearch.getStatus());
		query.setReadOnly(true);
		Long result=(Long) query.uniqueResult();
		session.close();
		return result;
		
	}
	
	

	@Override
	public Long CountSearchVacationP2(Long employee_id, VacationSearch vacationSearch) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select count(v) from Vacation v INNER JOIN Employee AS e ON v.employee_id= e.employee_id INNER JOIN Project AS p ON v.project_id=p.project_id ";
		hql += "WHERE (:pro_name IS NULL OR p.name LIKE CONCAT('%', :pro_name, '%')) ";
		hql += "AND (:status =0 or v.status=:status) ";
		hql += "AND ((:from_date IS NULL and ( :to_date IS NOT NULL and (:to_date >= v.to_date) or (:to_date<v.to_date and :to_date>=v.from_date))) ";
		hql += "or (:to_date IS NULL and (:from_date IS NOT NULL and :from_date <= v.to_date)) ";
		hql += "or (:from_date >= v.from_date and :from_date <= v.to_date and :to_date >= v.from_date and :to_date <= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date <= v.from_date and :to_date >= v.from_date and :to_date <= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date >= v.from_date and :from_date <= v.to_date and :to_date >= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date <= v.from_date and :to_date >= v.to_date and :from_date <= :to_date) ";
		hql += "or (:from_date IS NULL and :to_date IS NULL)) ";
		hql += "AND (v.employee_id=:employee_id) ";	
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		query.setParameter("pro_name", vacationSearch.getPro_name());
		query.setParameter("from_date", vacationSearch.getFrom_date());
		query.setParameter("to_date", vacationSearch.getTo_date());
		query.setParameter("status", vacationSearch.getStatus());
		query.setReadOnly(true);
		Long result=(Long) query.uniqueResult();
		session.close();
		return result;
	
	}

	
}
