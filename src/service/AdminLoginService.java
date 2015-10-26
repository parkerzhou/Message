package service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import po.Manager;
import po.User;

public class AdminLoginService {

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
	public Manager findUserByName(String managername){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="select man from Manager as man where man.man_name=:Name";
		Query query=session.createQuery(hql);
		query.setParameter("Name", managername);
		Manager manager=(Manager) query.uniqueResult();
		session.getTransaction().commit();
		return manager;
	}
	public Manager check(Manager manager){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql1="select man from Manager as man where man.man_name=:Name and man.man_password=:Pwd";
		Query query1=session.createQuery(hql1);
		query1.setParameter("Name",manager.getMan_name());
		query1.setParameter("Pwd",manager.getMan_password());
		Manager m=(Manager) query1.uniqueResult();
		session.getTransaction().commit();
		return m;
	}
	/*public User selectUserByName(String name){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="select u from User as u where u.user_name=:userName";
		Query query=session.createQuery(hql);
		query.setParameter("name", name);
		User user=(User) query.uniqueResult();
		session.getTransaction().commit();
		return user;
	}*/
}
