package Com.IFI.InternalTool.DS.DAO.Impl;

import java.sql.Date;
import java.util.List;

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

import Com.IFI.InternalTool.DS.DAO.AllocationDetailDAO;
import Com.IFI.InternalTool.DS.Model.AllocationDetail;

@Repository("AllocationDetailDAO")
@Transactional
public class AllocationDetailDAOImpl implements AllocationDetailDAO {
	@Autowired
	private EntityManagerFactory entityManagerFactory;

	private static final Logger logger = LoggerFactory.getLogger(AllocationDetailDAOImpl.class);

	private boolean success = false;

	@Override
	public List<AllocationDetail> getAllocationDetails(final int page, final int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "FROM AllocationDetail ";
		Query query = session.createQuery(hql);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<AllocationDetail> list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public boolean saveAllocationDetail(final AllocationDetail allocationDetail) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		try {
			session.saveOrUpdate(allocationDetail);
			success = true;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
		return success;
	}

	@Override
	public boolean deleteById(final long allocation_detail_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Delete from AllocationDetail where allocation_detail_id =:allocation_detail_id";
		Query query = session.createQuery(hql);
		query.setParameter("allocation_detail_id", allocation_detail_id);
		int row = query.executeUpdate();
		session.close();
		if (row > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public AllocationDetail findById(long allocation_detail_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "FROM AllocationDetail where allocation_detail_id =:allocation_detail_id ";
		Query query = session.createQuery(hql);
		query.setParameter("allocation_detail_id", allocation_detail_id);
		AllocationDetail allocationDetail = (AllocationDetail) query.uniqueResult();
		session.close();
		return allocationDetail;
	}

	@Override
	public List<AllocationDetail> findAllocationDetailFromToDate(Date from_date, Date to_date) {
		// TODO Auto-generated method stub
		return null;
	}

}
