package Com.IFI.InternalTool.DS.DAO.Impl;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManagerFactory;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Com.IFI.InternalTool.DS.DAO.ProjectManagerDAO;

@Repository("ProjectManagerDAO")
@Transactional
public class ProjectManagerDAOImpl implements ProjectManagerDAO {
	
	@Autowired
	private EntityManagerFactory entityManagerFactory;

	@Override
	public List<Long> getProjectIDs(long employee_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select pm.project_id from ProjectManager pm where pm.manager_id=:employee_id";
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id); 
		return (List<Long>) query.getResultList();
	}

}
