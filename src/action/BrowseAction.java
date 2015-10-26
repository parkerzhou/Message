package action;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import po.Message;
import po.User;
import service.BrowseService;

public class BrowseAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private User user;
	private Message message;
	private BrowseService browseService;
    private DateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public BrowseService getBrowseService() {
		return browseService;
	}
	public void setBrowseService(BrowseService browseService) {
		this.browseService = browseService;
	}
	public String load(){
		List<Message> AllMess=browseService.AllMess();
		getRequest().getSession().removeAttribute("AllMess");
		getRequest().getSession().setAttribute("AllMess",AllMess);
		List<Message> ChoiceMess=browseService.ChoiceMess();
		getRequest().getSession().removeAttribute("ChoiceMess");
		getRequest().getSession().setAttribute("ChoiceMess",ChoiceMess);
		List<Message> WishMess=browseService.WishMess();
		getRequest().getSession().removeAttribute("WishMess");
		getRequest().getSession().setAttribute("WishMess",WishMess);
		List<Message> LoveMess=browseService.LoveMess();
		getRequest().getSession().removeAttribute("LoveMess");
		getRequest().getSession().setAttribute("LoveMess",LoveMess);
		List<Message> FriendMess=browseService.FriendMess();
		getRequest().getSession().removeAttribute("FriendMess");
		getRequest().getSession().setAttribute("FriendMess",FriendMess);
		List<Message> FunnyMess=browseService.FunnyMess();
		getRequest().getSession().removeAttribute("FunnyMess");
		getRequest().getSession().setAttribute("FunnyMess",FunnyMess);
		List<Message> SadMess=browseService.SadMess();
		getRequest().getSession().removeAttribute("SadMess");
		getRequest().getSession().setAttribute("SadMess",SadMess);
		List<Message> OtherMess=browseService.OtherMess();
		getRequest().getSession().removeAttribute("OtherMess");
		getRequest().getSession().setAttribute("OtherMess",OtherMess);
		return "load";
	}
	public String getAllMess(){
		List<Message> AllMess=browseService.AllMess();
		getRequest().getSession().removeAttribute("AllMess");
		getRequest().getSession().setAttribute("AllMess",AllMess);
		return "all";
	}
	public String getChoiceMess(){
		List<Message> ChoiceMess=browseService.ChoiceMess();
		getRequest().getSession().removeAttribute("ChoiceMess");
		getRequest().getSession().setAttribute("ChoiceMess",ChoiceMess);
		return "choice";
	}	
	public String getWishMess(){
		List<Message> WishMess=browseService.WishMess();
		getRequest().getSession().removeAttribute("WishMess");
		getRequest().getSession().setAttribute("WishMess",WishMess);
		return "wish";
	}	
	public String getLoveMess(){
		List<Message> LoveMess=browseService.LoveMess();
		getRequest().getSession().removeAttribute("LoveMess");
		getRequest().getSession().setAttribute("LoveMess",LoveMess);
		return "love";
	}	
	public String getFriendMess(){
		List<Message> FriendMess=browseService.FriendMess();
		getRequest().getSession().removeAttribute("FriendMess");
		getRequest().getSession().setAttribute("FriendMess",FriendMess);
		return "friend";
	}	
	public String getFunnyMess(){
		List<Message> FunnyMess=browseService.FunnyMess();
		getRequest().getSession().removeAttribute("FunnyMess");
		getRequest().getSession().setAttribute("FunnyMess",FunnyMess);
		return "funny";
	}	
	public String getSadMess(){
		List<Message> SadMess=browseService.SadMess();
		getRequest().getSession().removeAttribute("SadMess");
		getRequest().getSession().setAttribute("SadMess",SadMess);
		return "sad";
	}	
	public String getOtherMess(){
		List<Message> OtherMess=browseService.OtherMess();
		getRequest().getSession().removeAttribute("OtherMess");
		getRequest().getSession().setAttribute("OtherMess",OtherMess);
		return "other";
	}	
	public String getContent(){
		int i=Integer.valueOf(getRequest().getParameter("i"));
		String sortid=getRequest().getParameter("type");
		List<Message> messages = null;
		if(sortid.equals("0")){
			messages=(List<Message>)getRequest().getSession().getAttribute("AllMess");
			
		}
		else if(sortid.equals("1")){
        	messages=(List<Message>)getRequest().getSession().getAttribute("WishMess");
        }
		else if(sortid.equals("2")){
			messages=(List<Message>)getRequest().getSession().getAttribute("LoveMess");
		}
        else if(sortid.equals("3")){
        	messages=(List<Message>)getRequest().getSession().getAttribute("FriendMess");
		}
        else if(sortid.equals("4")){
        	messages=(List<Message>)getRequest().getSession().getAttribute("FunnyMess");
        }
        else if(sortid.equals("5")){
        	messages=(List<Message>)getRequest().getSession().getAttribute("SadMess");
        }
        else if(sortid.equals("6")){
        	messages=(List<Message>)getRequest().getSession().getAttribute("OtherMess");
        }
        else if(sortid.equals("7")){
        	messages=(List<Message>)getRequest().getSession().getAttribute("ChoiceMess");
        }
        else if(sortid.equals("8")){
        	messages=(List<Message>)getRequest().getSession().getAttribute("OwnMess");
        }
		getRequest().getSession().setAttribute("i",i);
		getRequest().getSession().setAttribute("messages",messages);
		return "messages";
	}	
	public String exit(){
		getRequest().getSession().removeAttribute("user");
		return "exit";
	}	
	public String addMessage() throws UnsupportedEncodingException{
		getRequest().setCharacterEncoding("UTF-8");
		User u=(User) getRequest().getSession().getAttribute("user");
		if(u==null){
			message.setMess_user_name("匿名");
		}
		else{
			message.setMess_user_name(user.getUser_name());
			message.setMess_user_id(user.getUser_id());
		}
		message.setMess_time(new Date());
		if (browseService.save(message)!=null) {
			getRequest().getSession().setAttribute("url","browse");
			return "go";
		}
		return null;
	} 
	public String checkOwnMess(){
		User u=(User) getRequest().getSession().getAttribute("user");
		getRequest().getSession().removeAttribute("OwnMess");
		List<Message> OwnMess=browseService.OwnMess(u.getUser_id());
		getRequest().getSession().setAttribute("OwnMess",OwnMess);
		return "ownmess";
	}
	public String alterOwnInfo() throws UnsupportedEncodingException, NoSuchAlgorithmException{
		getRequest().setCharacterEncoding("UTF-8");
		User u=(User) getRequest().getSession().getAttribute("user");
		user.setUser_id(u.getUser_id());
		MessageDigest md = MessageDigest.getInstance("MD5"); 
		byte[] lpw=user.getUser_password().getBytes(); 
		md.update(lpw);
		byte[] Lpw=md.digest();
		user.setUser_password(new String(Lpw,"UTF-8"));
		if (browseService.update(user)!=null) {
			user=browseService.update(user);
			getRequest().getSession().setAttribute("url","owninfo");
			getRequest().getSession().setAttribute("user",user);
			return "go";
		}
		return null;
	}
}
