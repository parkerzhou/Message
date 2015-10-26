package service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import po.User;

public class LoginService {

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
		String hql1="select u from User as u where u.user_name=:userName";
		Query query1=session.createQuery(hql1);
		query1.setParameter("userName", username);
		User user=(User) query1.uniqueResult();
		//这句多余
		session.getTransaction().commit();
		return user;
	}
	public User check(User user){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		System.out.println("gf");
		String hql1="select u from User as u where u.user_name=:userName and u.user_password=:userPwd";
		Query query1=session.createQuery(hql1);
		query1.setParameter("userName",user.getUser_name());
		query1.setParameter("userPwd",user.getUser_password());
		User u=(User) query1.uniqueResult();
		session.getTransaction().commit();
		return u;
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
