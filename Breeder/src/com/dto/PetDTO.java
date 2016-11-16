package com.dto;

import java.io.Serializable;

public class PetDTO implements Serializable{
	private int p_num;
	private String userid;
	private String p_kkcnumber;
	private String p_name;
	private int p_age;
	private String p_gender;
	private String p_birth;
	private String p_type;
	private String p_photo;
	private String p_feature;
	private String mom_kkc;
	private String papa_kkc;
	public PetDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PetDTO(int p_num, String userid, String p_kkcnumber, String p_name, int p_age, String p_gender,
			String p_birth, String p_type, String p_photo, String p_feature, String mom_kkc, String papa_kkc) {
		super();
		this.p_num = p_num;
		this.userid = userid;
		this.p_kkcnumber = p_kkcnumber;
		this.p_name = p_name;
		this.p_age = p_age;
		this.p_gender = p_gender;
		this.p_birth = p_birth;
		this.p_type = p_type;
		this.p_photo = p_photo;
		this.p_feature = p_feature;
		this.mom_kkc = mom_kkc;
		this.papa_kkc = papa_kkc;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getP_birth() {
		return p_birth;
	}
	public void setP_birth(String p_birth) {
		this.p_birth = p_birth;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_photo() {
		return p_photo;
	}
	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}
	public String getP_feature() {
		return p_feature;
	}
	public void setP_feature(String p_feature) {
		this.p_feature = p_feature;
	}
	public String getMom_kkc() {
		return mom_kkc;
	}
	public void setMom_kkc(String mom_kkc) {
		this.mom_kkc = mom_kkc;
	}
	public String getPapa_kkc() {
		return papa_kkc;
	}
	public void setPapa_kkc(String papa_kkc) {
		this.papa_kkc = papa_kkc;
	}
	@Override
	public String toString() {
		return "PetDTO [p_num=" + p_num + ", userid=" + userid + ", p_kkcnumber=" + p_kkcnumber + ", p_name=" + p_name
				+ ", p_age=" + p_age + ", p_gender=" + p_gender + ", p_birth=" + p_birth + ", p_type=" + p_type
				+ ", p_photo=" + p_photo + ", p_feature=" + p_feature + ", mom_kkc=" + mom_kkc + ", papa_kkc="
				+ papa_kkc + "]";
	}
	
	

	

}
