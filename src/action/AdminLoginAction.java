package action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;

import po.Manager;
import service.AdminLoginService;

public class AdminLoginAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Manager manager;
	private AdminLoginService adminloginService;
	
    
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public AdminLoginService getAdminloginService() {
		return adminloginService;
	}
	public void setAdminloginService(AdminLoginService adminloginService) {
		this.adminloginService = adminloginService;
	}
	public String loginWeb() throws UnsupportedEncodingException{
		getRequest().setCharacterEncoding("UTF-8");
		String checkCode=(String) getRequest().getSession().getAttribute("checkCode");
		if(adminloginService.findUserByName(manager.getMan_name())==null){
			getRequest().getSession().setAttribute("adminnoexist","很抱歉，该管理员不存在！");
			getRequest().getSession().setAttribute("url","adminlogin");
			return "go";
		}
		else
		if (adminloginService.check(manager)!=null) {
			if(checkCode.equals(getRequest().getParameter("admincode"))){
			manager=adminloginService.check(manager);
			getRequest().getSession().setAttribute("url","manager");
			getRequest().getSession().setAttribute("manager",manager);
			return "go";}
			else{
				getRequest().getSession().setAttribute("admincodeerror","验证码错误！");
				getRequest().getSession().setAttribute("adminname",manager.getMan_name());
				getRequest().getSession().setAttribute("adminPWD",manager.getMan_password());
				getRequest().getSession().setAttribute("url","adminlogin");
				return "go";
			}
		}else {
			getRequest().getSession().setAttribute("checkadminerror","密码错误！");
			getRequest().getSession().setAttribute("adminname",manager.getMan_name());
			getRequest().getSession().setAttribute("url","adminlogin");
			return "go";
		}
	}
	public String checkManager() throws UnsupportedEncodingException{
		getRequest().setCharacterEncoding("UTF-8");
		String name=(String) getRequest().getParameter("user_name");
		if(name.isEmpty()){
			getRequest().getSession().setAttribute("adminmess","");
			return "checkadminname";
		}
		if (adminloginService.findUserByName(name)!=null) {
			getRequest().getSession().setAttribute("adminmess","该管理员存在！");
			return "checkadminname";
		}else {
			getRequest().getSession().setAttribute("adminmess","很抱歉，该管理员不存在！");
			return "checkadminname";
		}
	}
	public void changecheckcode(){
		String adminname=getRequest().getParameter("Name");
		String adminPWD=getRequest().getParameter("PWD");
		getRequest().getSession().setAttribute("adminname",adminname);
		getRequest().getSession().setAttribute("adminPWD",adminPWD);
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
}
