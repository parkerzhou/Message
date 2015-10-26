package action;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;

import po.User;
import service.LoginService;

public class LoginAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private User user;
	private LoginService loginservice;
    
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public LoginService getLoginservice() {
		return loginservice;
	}
	public void setLoginservice(LoginService loginservice) {
		this.loginservice = loginservice;
	}
	public String loginWeb() throws IOException, NoSuchAlgorithmException{
		getRequest().setCharacterEncoding("UTF-8");
		String checkCode=(String) getRequest().getSession().getAttribute("checkCode");
		String PDW=user.getUser_password();
		MessageDigest md = MessageDigest.getInstance("MD5"); 
		byte[] lpw=user.getUser_password().getBytes(); 
		md.update(lpw);
		byte[] Lpw=md.digest();
		user.setUser_password(new String(Lpw,"UTF-8"));
		if(loginservice.findUserByName(user.getUser_name())==null){
			getRequest().getSession().setAttribute("noexist","很抱歉，该用户名不存在！");
			getRequest().getSession().setAttribute("name",user.getUser_name());
			getRequest().getSession().setAttribute("password",PDW);
			getRequest().getSession().setAttribute("url","login");
			return "go";
		}
		else
		if (loginservice.check(user)!=null) {
			if(checkCode.equals(getRequest().getParameter("code"))){	
			user=loginservice.check(user);
			getRequest().getSession().setAttribute("url","browse");
			getRequest().getSession().setAttribute("user",user);
			return "go";
			}else{
				getRequest().getSession().setAttribute("codeerror","验证码错误！");
				getRequest().getSession().setAttribute("name",user.getUser_name());
				getRequest().getSession().setAttribute("password",PDW);
				getRequest().getSession().setAttribute("url","login");
				return "go";	
			}
		}else {
			getRequest().getSession().setAttribute("checkerror","密码错误！");
			getRequest().getSession().setAttribute("name",user.getUser_name());
			getRequest().getSession().setAttribute("password",PDW);
			getRequest().getSession().setAttribute("url","login");
			return "go";
		}
	}
	public String checkUser() throws IOException{
		getRequest().setCharacterEncoding("UTF-8");
		String name=(String) getRequest().getParameter("user_name");
		if(name.isEmpty()){
			getRequest().getSession().setAttribute("mess","");
			return "checkname";
		}
		if (loginservice.findUserByName(name)!=null) {
			getRequest().getSession().setAttribute("mess","该用户名存在！");
			return "checkname";
		}else {
			getRequest().getSession().setAttribute("mess","很抱歉，该用户名不存在！");
			return "checkname";
		}
	}
	public void checkcode() throws IOException{
		getResponse().setContentType("image/jpeg");
		HttpSession session=getRequest().getSession();
		int width=60;
		int height=20;
//		设置浏览器不要缓存此图片
		getResponse().setHeader("Pragma","No-cache");
		getResponse().setHeader("Cache-Control","no-cache");
		getResponse().setDateHeader("Expires", 0);
//		创建内存图像并获得其图形上下文
		BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g=image.getGraphics();
//		产生随机验证码
//		定义验证码的字符表
		String chars="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		char[] rands=new char[4];
		for(int i=0;i<4;i++){
			int rand=(int)(Math.random()*36);
			rands[i]=chars.charAt(rand);
		}
//		产生图像
//		画背景
		g.setColor(new Color(0xDCDCDC));
		g.fillRect(0, 0, width, height);
//		随机产生120个干扰点
		for(int i=0;i<120;i++){
			int x=(int)(Math.random()*width);
			int y=(int)(Math.random()*height);
			int red=(int)(Math.random()*255);
			int green=(int)(Math.random()*255);
			int blue=(int)(Math.random()*255);
			g.setColor(new Color(red,green,blue));
			g.drawOval(x, y, 1, 0);
		}
		g.setColor(Color.BLACK);
		g.setFont(new Font(null, Font.ITALIC|Font.BOLD, 18));
//		在不同高度上输出验证码的不同字符
	    g.drawString(""+rands[0], 1, 17);
	    g.drawString(""+rands[1], 16, 15);
	    g.drawString(""+rands[2], 31, 18);
	    g.drawString(""+rands[3], 46, 16);
	    g.dispose();
//	           将图像输出到客户端
	    ServletOutputStream sos=getResponse().getOutputStream();
	    ByteArrayOutputStream baos=new ByteArrayOutputStream();
	    ImageIO.write(image, "JPEG", baos);
	    byte[] buffer=baos.toByteArray();
	    getResponse().setContentLength(buffer.length);
	    sos.write(buffer);
	    baos.close();
	    sos.close();
	    session.setAttribute("checkCode", new String(rands));
	}
	public void changecheckcode(){
		String name=getRequest().getParameter("Name");
		String password=getRequest().getParameter("PWD");
		getRequest().getSession().setAttribute("name",name);
		getRequest().getSession().setAttribute("password",password);
	}
}
