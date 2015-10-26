package service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import po.User;

public class RegisterService {

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public User save(User user){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		return user;
	}
	public User findUserByName(String username){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="select u from User as u where u.user_name=:userName";
		Query query=session.createQuery(hql);
		query.setParameter("userName", username);
		User user=(User) query.uniqueResult();
		session.getTransaction().commit();
		return user;
	}
}
