package com.dto;

public class NotifyDTO {

	private int notify_num;

	private String username;
	private String userid;
	private String notifyReason;
	private int notifyCount;
	private String notifyContent;
	private String notifyrequest;
	public NotifyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NotifyDTO(int notify_num, String username, String userid, String notifyReason, int notifyCount,
			String notifyContent, String notifyrequest) {
		super();
		this.notify_num = notify_num;
		this.username = username;
		this.userid = userid;
		this.notifyReason = notifyReason;
		this.notifyCount = notifyCount;
		this.notifyContent = notifyContent;
		this.notifyrequest = notifyrequest;
	}
	public int getNotify_num() {
		return notify_num;
	}
	public void setNotify_num(int notify_num) {
		this.notify_num = notify_num;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNotifyReason() {
		return notifyReason;
	}
	public void setNotifyReason(String notifyReason) {
		this.notifyReason = notifyReason;
	}
	public int getNotifyCount() {
		return notifyCount;
	}
	public void setNotifyCount(int notifyCount) {
		this.notifyCount = notifyCount;
	}
	public String getNotifyContent() {
		return notifyContent;
	}
	public void setNotifyContent(String notifyContent) {
		this.notifyContent = notifyContent;
	}
	public String getNotifyrequest() {
		return notifyrequest;
	}
	public void setNotifyrequest(String notifyrequest) {
		this.notifyrequest = notifyrequest;
	}
	@Override
	public String toString() {
		return "NotifyDTO [notify_num=" + notify_num + ", username=" + username + ", userid=" + userid
				+ ", notifyReason=" + notifyReason + ", notifyCount=" + notifyCount + ", notifyContent=" + notifyContent
				+ ", notifyrequest=" + notifyrequest + "]";
	}
	
	
	
	
	
	

}
