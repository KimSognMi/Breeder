package com.dto;

public class ApplyPetDTO {

	private String p_kkcnumber;
	private String p_name;
	private int p_age;
	private String p_gender;
	private String p_type;
	private String r_content;
	private String agree;
	private int p_num;
	private String p_photo;
	private String phone;
	private String p_feature;
	private String userid;
	private int r_num;
	public ApplyPetDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApplyPetDTO(String p_kkcnumber, String p_name, int p_age, String p_gender, String p_type, String r_content,
			String agree, int p_num, String p_photo, String phone, String p_feature, String userid, int r_num) {
		super();
		this.p_kkcnumber = p_kkcnumber;
		this.p_name = p_name;
		this.p_age = p_age;
		this.p_gender = p_gender;
		this.p_type = p_type;
		this.r_content = r_content;
		this.agree = agree;
		this.p_num = p_num;
		this.p_photo = p_photo;
		this.phone = phone;
		this.p_feature = p_feature;
		this.userid = userid;
		this.r_num = r_num;
	}
	public String getP_kkcnumber() {
		return p_kkcnumber;
	}
	public void setP_kkcnumber(String p_kkcnumber) {
		this.p_kkcnumber = p_kkcnumber;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_age() {
		return p_age;
	}
	public void setP_age(int p_age) {
		this.p_age = p_age;
	}
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
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
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_photo() {
		return p_photo;
	}
	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getP_feature() {
		return p_feature;
	}
	public void setP_feature(String p_feature) {
		this.p_feature = p_feature;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	@Override
	public String toString() {
		return "ApplyPetDTO [p_kkcnumber=" + p_kkcnumber + ", p_name=" + p_name + ", p_age=" + p_age + ", p_gender="
				+ p_gender + ", p_type=" + p_type + ", r_content=" + r_content + ", agree=" + agree + ", p_num=" + p_num
				+ ", p_photo=" + p_photo + ", phone=" + phone + ", p_feature=" + p_feature + ", userid=" + userid
				+ ", r_num=" + r_num + "]";
	}
	
	

	
	
	

}
