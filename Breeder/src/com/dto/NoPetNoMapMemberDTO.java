package com.dto;

public class NoPetNoMapMemberDTO {

	
	private String p_num;

	public NoPetNoMapMemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoPetNoMapMemberDTO(String p_num) {
		super();
		this.p_num = p_num;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	@Override
	public String toString() {
		return "NoPetNoMapMemberDTO [p_num=" + p_num + "]";
	}
	
}
