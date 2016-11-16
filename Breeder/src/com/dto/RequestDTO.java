package com.dto;

public class RequestDTO {

	private int r_num;
	private String userid;
	private int p_num;
	private String r_content;
	private String agree;
	private String requestid;

	@Override
	public String toString() {
		return "RequestDTO [r_num=" + r_num + ", userid=" + userid + ", p_num=" + p_num + ", r_content=" + r_content
				+ ", agree=" + agree + ", requestid=" + requestid + "]";
	}

	public RequestDTO(int r_num, String userid, int p_num, String r_content, String agree, String requestid) {
		super();
		this.r_num = r_num;
		this.userid = userid;
		this.p_num = p_num;
		this.r_content = r_content;
		this.agree = agree;
		this.requestid = requestid;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getAgree() {
		return agree;
	}

	public void setAgree(String agree) {
		this.agree = agree;
	}

	public String getRequestid() {
		return requestid;
	}

	public void setRequestid(String requestid) {
		this.requestid = requestid;
	}

	public RequestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
