package com.dto;

public class MemberPetSearchDTO {
	// whghlㅁㄴㅇㄹsadf

	private String userid;
	private String p_name;
	private String addr1;
	private String addr2;
	private String p_kkcnumber;
	private int p_age;
	private String p_gender;
	private String p_type;
	private String p_photo;
	private int p_num;

	public MemberPetSearchDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberPetSearchDTO(String userid, String p_name, String addr1, String addr2, String p_kkcnumber, int p_age,
			String p_gender, String p_type, String p_photo, int p_num) {
		super();
		this.userid = userid;
		this.p_name = p_name;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.p_kkcnumber = p_kkcnumber;
		this.p_age = p_age;
		this.p_gender = p_gender;
		this.p_type = p_type;
		this.p_photo = p_photo;
		this.p_num = p_num;
	}

	@Override
	public String toString() {
		return "MemberPetSearchDTO [userid=" + userid + ", p_name=" + p_name + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", p_kkcnumber=" + p_kkcnumber + ", p_age=" + p_age + ", p_gender=" + p_gender + ", p_type=" + p_type
				+ ", p_photo=" + p_photo + ", p_num=" + p_num + "]";
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

	public String getP_kkcnumber() {
		return p_kkcnumber;
	}

	public void setP_kkcnumber(String p_kkcnumber) {
		this.p_kkcnumber = p_kkcnumber;
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

	public String getP_photo() {
		return p_photo;
	}

	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

}
