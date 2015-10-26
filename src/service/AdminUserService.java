package service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import po.Message;
import po.User;

public class AdminUserService {
private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
    public List<User> UserMess(){
    	Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from User as u";
		Query query=session.createQuery(hql);
		List<User> users=query.list();
		session.getTransaction().commit();
		return users;
    }
    public void DeleteUser(User user){
    	Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.delete(user);
		session.getTransaction().commit();
    }
}
