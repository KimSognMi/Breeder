package com.dto;

public class MemberDTO {

	private int m_num;

	private String username;
	private String userid;
	private String passwd;
	private String phone;
	private String post1;
	private String post2;
	private String addr1;
	private String addr2;

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

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPost1() {
		return post1;
	}

	public void setPost1(String post1) {
		this.post1 = post1;
	}

	public String getPost2() {
		return post2;
	}

	public void setPost2(String post2) {
		this.post2 = post2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int m_num, String username, String userid, String passwd, String phone, String post1, String post2,
			String addr1, String addr2) {
		super();
		this.m_num = m_num;
		this.username = username;
		this.userid = userid;
		this.passwd = passwd;
		this.phone = phone;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
	}

	@Override
	public String toString() {
		return "MemberDTO [m_num=" + m_num + ", username=" + username + ", userid=" + userid + ", passwd=" + passwd
				+ ", phone=" + phone + ", post1=" + post1 + ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2
				+ "]";
	}

}
