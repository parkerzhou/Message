package po;


import java.util.Date;

public class Message {
    public int mess_id;
    public int mess_user_id;
    public String mess_theme;
    public String mess_content;
    public int mess_isselected;
    public String mess_reply_name;
    public String mess_reply_content;
    public Date mess_time;
    public Date mess_reply_time;
    public String mess_user_name;
    public int mess_sort_id;
    
	public int getMess_sort_id() {
		return mess_sort_id;
	}
	public void setMess_sort_id(int mess_sort_id) {
		this.mess_sort_id = mess_sort_id;
	}
	public int getMess_id() {
		return mess_id;
	}
	public void setMess_id(int mess_id) {
		this.mess_id = mess_id;
	}
	public int getMess_user_id() {
		return mess_user_id;
	}
	public void setMess_user_id(int mess_user_id) {
		this.mess_user_id = mess_user_id;
	}
	public String getMess_theme() {
		return mess_theme;
	}
	public void setMess_theme(String mess_theme) {
		this.mess_theme = mess_theme;
	}
	public String getMess_content() {
		return mess_content;
	}
	public void setMess_content(String mess_content) {
		this.mess_content = mess_content;
	}
	public int getMess_isselected() {
		return mess_isselected;
	}
	public void setMess_isselected(int mess_isselected) {
		this.mess_isselected = mess_isselected;
	}
	public String getMess_reply_name() {
		return mess_reply_name;
	}
	public void setMess_reply_name(String mess_reply_name) {
		this.mess_reply_name = mess_reply_name;
	}
	public String getMess_reply_content() {
		return mess_reply_content;
	}
	public void setMess_reply_content(String mess_reply_content) {
		this.mess_reply_content = mess_reply_content;
	}
	public String getMess_user_name() {
		return mess_user_name;
	}
	public void setMess_user_name(String mess_user_name) {
		this.mess_user_name = mess_user_name;
	}
	
	public Date getMess_time() {
		return mess_time;
	}
	public void setMess_time(Date mess_time) {
		this.mess_time = mess_time;
	}
	public Date getMess_reply_time() {
		return mess_reply_time;
	}
	public void setMess_reply_time(Date mess_reply_time) {
		this.mess_reply_time = mess_reply_time;
	}
	
	
}
