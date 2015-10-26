package service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import po.Manager;
import po.Message;

public class AdminMessageService {
private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
    public Message addReply(Message message){
    	Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.update(message);
		session.getTransaction().commit();
		return message;
    }
    public void deleteMessById(Message message){
    	Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.delete(message);
		session.getTransaction().commit();
    }
    public void selected(Message message){
    	Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.update(message);
		session.getTransaction().commit();
    }
}
