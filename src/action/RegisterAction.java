package action;


import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import po.User;
import service.RegisterService;


public class RegisterAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private User user;
	private RegisterService registerservice;
    
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public RegisterService getRegisterservice() {
		return registerservice;
	}
	public void setRegisterservice(RegisterService registerservice) {
		this.registerservice = registerservice;
	}
	public String save() throws IOException, NoSuchAlgorithmException{
		getRequest().setCharacterEncoding("UTF-8");
		MessageDigest md = MessageDigest.getInstance("MD5"); 
		byte[] lpw=user.getUser_password().getBytes(); 
		md.update(lpw);
		byte[] Lpw=md.digest();
		user.setUser_password(new String(Lpw,"UTF-8"));
		if(registerservice.findUserByName(user.getUser_name())!=null){
			getRequest().getSession().setAttribute("exist","该用户名已存在，请用其他用户名！");
			getRequest().getSession().setAttribute("url","register");
			return "go";
		}
		else if (registerservice.save(user)!=null) {
			user=registerservice.findUserByName(user.getUser_name());
			getRequest().getSession().setAttribute("url","browse");
			getRequest().getSession().setAttribute("user",user);
			return "go";
		}else {
			return "";
		}
	}
	public String checkUser() throws IOException{
		getRequest().setCharacterEncoding("UTF-8");
		String name=(String) getRequest().getParameter("user_name");
		if(name.isEmpty()){
			getRequest().getSession().setAttribute("mess","");
			return "checkname";
		}
		if (registerservice.findUserByName(name)!=null) {
			getRequest().getSession().setAttribute("mess","该用户名已存在，请用其他用户名！");
			return "checkname";
		}else {
			getRequest().getSession().setAttribute("mess","可以用该用户名！");
			return "checkname";
		}
	}
}
