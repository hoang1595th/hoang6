package Com.IFI.InternalTool.DS.DAO.Impl;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManagerFactory;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Com.IFI.InternalTool.DS.DAO.AllocationDAO;
import Com.IFI.InternalTool.DS.DAO.ProjectManagerDAO;
import Com.IFI.InternalTool.DS.Model.Allocation;
import Com.IFI.InternalTool.DS.Model.AllocationDetail;
import Com.IFI.InternalTool.Payloads.AllocationResponse;
import Com.IFI.InternalTool.Payloads.PagedResponse;

@Repository("AllocationDAO")
@Transactional
public class AllocationDAOImpl implements AllocationDAO {
	@Autowired
	private EntityManagerFactory entityManagerFactory;
	private static final Logger logger = LoggerFactory.getLogger(AllocationDAOImpl.class);

	@Autowired
	AllocationDetailDAOImpl allocationDetailDAO;
	@Autowired
	private ProjectManagerDAO projectManagerDAO;

	private boolean success = false;

	@Override
	public List<Allocation> getAllocations(final long employee_id, final int page, final int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "FROM Allocation where employee_id= :employee_id ";

		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults((page + 1) * pageSize - 1);
		List<Allocation> list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public List<Allocation> getAllocatedOfManager(final long employee_id, final int page, final int pageSize) {

		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select a FROM Allocation a where a.project_id in (select pm.project_id from ProjectManager pm where pm.manager_id = :employee_id)";
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults((page + 1) * pageSize - 1);
		List<Allocation> list = query.getResultList();
		session.close();
		return list;

	}

	@Override
	public Boolean saveAllocation(final Allocation allocation) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.saveOrUpdate(allocation);

			// // generic allocationDetail
			LocalDate start_date = allocation.getStart_date().toLocalDate();
			LocalDate end_date = allocation.getEnd_date().toLocalDate();
			while (start_date.isBefore(end_date) || start_date.equals(end_date)) {
				if ((start_date.getDayOfWeek() != DayOfWeek.SATURDAY
						&& start_date.getDayOfWeek() != DayOfWeek.SUNDAY)) {
					AllocationDetail a = new AllocationDetail();
					a.setEmployee_id(allocation.getEmployee_id());
					a.setDate((Date) (Date.valueOf(start_date)));
					a.setTime(8);
					allocationDetailDAO.saveAllocationDetail(a);
				}
				start_date = start_date.plusDays(1);
			}
			tx.commit();
			success = true;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
		return success;

	}

	@Override
	public Boolean updateAllocation(Allocation allocation) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		boolean success = false;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Allocation currentAllocation = session.get(Allocation.class, allocation.getAllocation_id());
			currentAllocation.setAllocation_plan(allocation.getAllocation_plan());
			currentAllocation.setEmployee_id(allocation.getEmployee_id());
			currentAllocation.setEnd_date(allocation.getEnd_date());
			currentAllocation.setMonth(allocation.getMonth());
			currentAllocation.setProject_id(allocation.getProject_id());
			currentAllocation.setStart_date(allocation.getStart_date());
			currentAllocation.setYear(allocation.getYear());
			tx.commit();
			success = true;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
		return success;
	}

	@Override
	public Boolean deleteById(final long allocation_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		// xoa cac detail allocation
		String hqlDeleteDetail = "delete from AllocationDetail where allocation_id = :allocation_id";
		Query queryDeleteDetail = session.createQuery(hqlDeleteDetail);
		queryDeleteDetail.executeUpdate();
		// xoa allocation
		String hql = "Delete from Allocation where allocation_id=:allocation_id";
		Query query = session.createQuery(hql);
		query.setParameter("allocation_id", allocation_id);
		int row = query.executeUpdate();
		tx.commit();
		session.close();
		if (row > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Allocation findById(final long allocation_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "FROM Allocation where allocation_id=:allocation_id ";
		Query query = session.createQuery(hql);
		query.setParameter("allocation_id", allocation_id);
		Allocation allocation = (Allocation) query.uniqueResult();
		session.close();
		return allocation;
	}

	@Override
	public Date findMaxEndDate(long employee_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "SELECT MAX(a.end_date) FROM Allocation a where a.employee_id = :employee_id";
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		if (query.uniqueResult() != null) {
			return (Date) query.uniqueResult();
		}
		return null;
	}

	public List<Allocation> searchAllocationWithTime(final int year, final int month, final int page,
			final int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "select a FROM Allocation a where ";

		if (year > 0) {
			hql += "a.year = :year";
			if (month >= 1 && month <= 12) {
				hql += " and a.month = :month ";
			}
		} else {
			if (month >= 1 && month <= 12) {
				hql += "a.month = :month ";
			}
		}

		Query query = session.createQuery(hql);

		if (year > 0) {
			query.setParameter("year", year);
		}
		if (month >= 1 && month <= 12) {
			query.setParameter("month", month);
		}

		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);

		List<Allocation> list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public List<Allocation> findAllocationByEmployeeID(final long employee_id, final int page, final int pageSize) {

		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "select a FROM Allocation a where a.employee_id = :employee_id ";
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Allocation> list = query.getResultList();
		session.close();
		return list;

	}

	@Override
	public List<Allocation> findAllocationByProjectID(final long project_id, final int page, final int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "select a FROM Allocation a where a.project_id = :project_id";
		Query query = session.createQuery(hql);
		query.setParameter("project_id", project_id);

		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);

		List<Allocation> list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public List<Allocation> findAllocationFromDateToDate(Date fromDate, Date toDate, final int page,
			final int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "from Allocation where allocation_id in (select allocation_id from AllocationDetail where date between :fromDate and :toDate)";
		Query query = session.createQuery(hql);
		query.setParameter("fromDate", fromDate);
		query.setParameter("toDate", fromDate);

		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);

		List<Allocation> list = query.getResultList();
		session.close();
		return list;
	}

}
