package action;

import java.util.Date;
import java.util.List;

import org.apache.catalina.connector.Request;

import po.Manager;
import po.Message;
import po.User;
import service.AdminMessageService;

public class AdminMessageAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Message message;
	private Manager manager;
	private User user;
	private AdminMessageService adminmessageService;
	
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public AdminMessageService getAdminmessageService() {
		return adminmessageService;
	}
	public void setAdminmessageService(AdminMessageService adminmessageService) {
		this.adminmessageService = adminmessageService;
	}
	public String exit(){
		getRequest().getSession().removeAttribute("manager");
		return "exit";
	}
	public String addReply(){
		List<Message> m=(List<Message>) getRequest().getSession().getAttribute("messages");
		Manager manager=(Manager)getRequest().getSession().getAttribute("manager");
		Integer i=(Integer) getRequest().getSession().getAttribute("i");
		m.get(i).setMess_reply_content(message.getMess_reply_content());
		m.get(i).setMess_reply_time(new Date());
		m.get(i).setMess_reply_name(manager.getMan_name());
		if (adminmessageService.addReply(m.get(i))!=null) {
			getRequest().getSession().setAttribute("messages",m);
			getRequest().getSession().setAttribute("url","manager");
			return "go";
		}
		return null;
	}
	public String deleteMessage(){
		List<Message> m=(List<Message>) getRequest().getSession().getAttribute("messages");
		Integer i=(Integer) getRequest().getSession().getAttribute("i");
		adminmessageService.deleteMessById(m.get(i));
		return "manager";
	}
	public String selected(){
		List<Message> m=(List<Message>) getRequest().getSession().getAttribute("messages");
		Integer i=(Integer) getRequest().getSession().getAttribute("i");
		if(m.get(i).getMess_isselected()==0){
		    m.get(i).setMess_isselected(1);
		}
		else{
			m.get(i).setMess_isselected(0);
		}
		adminmessageService.selected(m.get(i));
		getRequest().getSession().setAttribute("url","adminlogin");
		return "go";
	}
}
