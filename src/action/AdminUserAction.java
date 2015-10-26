package action;

import java.util.List;

import po.Manager;
import po.User;
import service.AdminUserService;

public class AdminUserAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private User user;
	private Manager manager;
	private AdminUserService adminuserService;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public AdminUserService getAdminuserService() {
		return adminuserService;
	}
	public void setAdminuserService(AdminUserService adminuserService) {
		this.adminuserService = adminuserService;
	}
	public String checkUserMess(){
		List<User> users=adminuserService.UserMess();
		getRequest().getSession().removeAttribute("users");
		getRequest().getSession().setAttribute("users",users);
		return "manageruser";
	}
	public String deleteUser(){
		List<User> users=(List<User>) getRequest().getSession().getAttribute("users");
		int j=Integer.valueOf(getRequest().getParameter("j"));
        adminuserService.DeleteUser(users.get(j));
        users=adminuserService.UserMess();
        getRequest().getSession().setAttribute("users",users);
        return "manageruser";
	}
}
