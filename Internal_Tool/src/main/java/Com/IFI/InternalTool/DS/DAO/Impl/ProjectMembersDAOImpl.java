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

import Com.IFI.InternalTool.DS.DAO.ProjectMembersDAO;
import Com.IFI.InternalTool.DS.Model.Allocation;
import Com.IFI.InternalTool.DS.Model.ProjectMembers;

@Repository("ProjectMembersDAO")
@Transactional
public class ProjectMembersDAOImpl implements ProjectMembersDAO {
	private boolean success = false;

	@Autowired
	private EntityManagerFactory entityManagerFactory;
	@Autowired
	private AllocationDAOImpl allocationDAO;

	@Override
	public Boolean isMembersOfProject(long employee_id, final long project_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = " From ProjectMembers where employee_id=:employee_id and project_id=:project_id";
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_id);
		query.setParameter("project_id", project_id);
		try {
			query.getSingleResult();
			success = true;
		} catch (Exception e) {
			return false;
		} finally {
			session.close();
		}
		return success;
	}

	@Override
	public Boolean addMemberToProject(ProjectMembers projectMember) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		/*if (isMembersOfProject(projectMember.getEmployee_id(), projectMember.getProject_id())) {
			return false;
		}*/

		// projectMember.setPriority(employeeDAO.getEmployeeById(projectMember.getEmployee_id()).getType_id());
		try {
			session.saveOrUpdate(projectMember);
			success = true;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
		return success;
	}

	@Override
	public Boolean removeMemberOfProject(long projectMemberId) {

		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		boolean success = false;
		Transaction tx = null;
		tx = session.beginTransaction();
		String hql = "Delete from ProjectMembers where project_members_id = :project_members_id amd ";
		Query query = session.createQuery(hql);
		query.setParameter("project_members_id", projectMemberId);
		int row = query.executeUpdate();
		success = true;
		tx.commit();
		session.close();
		if (row > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Long> listEmPloyeesIdInProject(long project_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select distinct pm.employee_id From ProjectMembers pm where pm.project_id =: project_id";
		Query query = session.createQuery(hql);
		query.setParameter("project_id", project_id);
		return query.getResultList();
	}

	@Override
	public boolean deleteAllMemberInProject(long projectId) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		// xoa tat ca allocation cua project do
		for (Allocation allocation : allocationDAO.findAllocationByProjectID(projectId, 1, Integer.MAX_VALUE)) {
			allocationDAO.deleteById(allocation.getAllocation_id());
		}
		//xoa tat ca nhan vien trong project
		String hql = "Delete from ProjectMembers where project_id = :project_id";
		Query query = session.createQuery(hql);
		query.setParameter("project_id", projectId);
		int row = query.executeUpdate();
		tx.commit();
		session.close();
		if (row > 0) {
			return true;
		} else {
			return false;
		}
	}

}
