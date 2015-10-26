package service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import po.*;

public class BrowseService {

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Message> AllMess(){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from Message as mess order by mess.mess_time desc";
		Query query=session.createQuery(hql);
		List<Message> messages=query.list();
		session.getTransaction().commit();
		return messages;
	}
	public List<Message> ChoiceMess(){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from Message as mess where mess.mess_isselected=1 order by mess.mess_time desc";
		Query query=session.createQuery(hql);
		List<Message> messages=query.list();
		session.getTransaction().commit();
		return messages;
	}
	public List<Message> WishMess(){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from Message as mess where mess.mess_sort_id=1 order by mess.mess_time desc";
		Query query=session.createQuery(hql);
		List<Message> messages=query.list();
		session.getTransaction().commit();
		return messages;
	}
	public List<Message> LoveMess(){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from Message as mess where mess.mess_sort_id=2 order by mess.mess_time desc";
		Query query=session.createQuery(hql);
		List<Message> messages=query.list();
		session.getTransaction().commit();
		return messages;
	}
	public List<Message> FriendMess(){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from Message as mess where mess.mess_sort_id=3 order by mess.mess_time desc";
		Query query=session.createQuery(hql);
		List<Message> messages=query.list();
		session.getTransaction().commit();
		return messages;
	}
	public List<Message> FunnyMess(){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from Message as mess where mess.mess_sort_id=4 order by mess.mess_time desc";
		Query query=session.createQuery(hql);
		List<Message> messages=query.list();
		session.getTransaction().commit();
		return messages;
	}
	public List<Message> SadMess(){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from Message as mess where mess.mess_sort_id=5 order by mess.mess_time desc";
		Query query=session.createQuery(hql);
		List<Message> messages=query.list();
		session.getTransaction().commit();
		return messages;
	}
	public List<Message> OtherMess(){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from Message as mess where mess.mess_sort_id=6 order by mess.mess_time desc";
		Query query=session.createQuery(hql);
		List<Message> messages=query.list();
		session.getTransaction().commit();
		return messages;
	}
	public Message save(Message message){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.save(message);
		session.getTransaction().commit();
		return message;
	}
	public List<Message> OwnMess(int userid){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql="from Message as mess where mess.mess_user_id=:userid order by mess.mess_time desc";
		Query query=session.createQuery(hql);
		query.setParameter("userid",userid);
		List<Message> messages=query.list();
		session.getTransaction().commit();
		return messages;
	}
	public User update(User user){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.update(user);
		session.getTransaction().commit();
		return user;
	}
}
