package com.dto;

public class MemberPetDTO {
//whghl
	private int m_num;
	private String username;
	private String userid;
	private String p_name;
	private String p_num;
	private String notifyCount;
	public MemberPetDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberPetDTO(int m_num, String username, String userid, String p_name, String p_num, String notifyCount) {
		super();
		this.m_num = m_num;
		this.username = username;
		this.userid = userid;
		this.p_name = p_name;
		this.p_num = p_num;
		this.notifyCount = notifyCount;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getNotifyCount() {
		return notifyCount;
	}
	public void setNotifyCount(String notifyCount) {
		this.notifyCount = notifyCount;
	}
	@Override
	public String toString() {
		return "MemberPetDTO [m_num=" + m_num + ", username=" + username + ", userid=" + userid + ", p_name=" + p_name
				+ ", p_num=" + p_num + ", notifyCount=" + notifyCount + "]";
	}
	
	

	

}
