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

import Com.IFI.InternalTool.DS.DAO.Group_IFIDAO;
import Com.IFI.InternalTool.DS.Model.Group_IFI;

@Repository("GroupDAO")
@Transactional
public class Group_IFIDAOImpl implements Group_IFIDAO {
	@Autowired
	private EntityManagerFactory entityManagerFactory;

	private boolean success = false;

	@Override
	public Boolean saveGroup(Group_IFI group) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		try {
			session.saveOrUpdate(group);
			success = true;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
		return success;
	}

	@Override
	public Group_IFI findGroupById(String group_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "Select g FROM Group_IFI g where g.group_id = :group_id ";
		Query query = session.createQuery(hql);
		query.setParameter("group_id", group_id);
		Group_IFI group = (Group_IFI) query.getSingleResult();
		session.close();
		return group;
	}

	@Override
	public List<Group_IFI> findGroupNameLike(String name, final int page, final int pageSize) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "from Group_IFI  where  name LIKE CONCAT('%', :name, '%') ";
		Query query = session.createQuery(hql);
		query.setParameter("name", name);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Group_IFI> list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public List<Group_IFI> getGroups(int page, int pageSize) {

		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		String hql = "from Group_IFI";
		Query query = session.createQuery(hql);
		query.setFirstResult((page - 1) * pageSize);
		query.setFetchSize(pageSize);
		query.setMaxResults(pageSize);

		List<Group_IFI> list = query.getResultList();
		if (list.size() > pageSize) {
			return list = list.subList(0, pageSize);
		}
		session.close();
		return list;
	}

	@Override
	public Boolean deleteGroupById(String group_id) {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		String hql = "Delete from Group_IFI where group_id=:group_id";
		Query query = session.createQuery(hql);
		query.setParameter("group_id", group_id);
		int row = query.executeUpdate();
		tx.commit();
		session.close();
		if (row == 0) {
			return false;
		} else
			return true;
	}

}
