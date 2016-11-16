package com.dto;

import java.io.Serializable;

public class PetTreeDTO implements Serializable {
	private int p_num;
	private String p_name;
	private String p_photo;
	private String mom_photo;
	private String papa_photo;
	private String gmom_photo;
	private String gpapa_photo;
	private String pp_photo;
	private String mp_photo;

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_photo() {
		return p_photo;
	}

	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}

	public String getMom_photo() {
		return mom_photo;
	}

	public void setMom_photo(String mom_photo) {
		this.mom_photo = mom_photo;
	}

	public String getPapa_photo() {
		return papa_photo;
	}

	public void setPapa_photo(String papa_photo) {
		this.papa_photo = papa_photo;
	}

	public String getGmom_photo() {
		return gmom_photo;
	}

	public void setGmom_photo(String gmom_photo) {
		this.gmom_photo = gmom_photo;
	}

	public String getGpapa_photo() {
		return gpapa_photo;
	}

	public void setGpapa_photo(String gpapa_photo) {
		this.gpapa_photo = gpapa_photo;
	}

	public String getPp_photo() {
		return pp_photo;
	}

	public void setPp_photo(String pp_photo) {
		this.pp_photo = pp_photo;
	}

	public String getMp_photo() {
		return mp_photo;
	}

	public void setMp_photo(String mp_photo) {
		this.mp_photo = mp_photo;
	}

	@Override
	public String toString() {
		return "PetTreeDTO [p_num=" + p_num + ", p_name=" + p_name + ", p_photo=" + p_photo + ", mom_photo=" + mom_photo
				+ ", papa_photo=" + papa_photo + ", gmom_photo=" + gmom_photo + ", gpapa_photo=" + gpapa_photo
				+ ", pp_photo=" + pp_photo + ", mp_photo=" + mp_photo + "]";
	}

	public PetTreeDTO(int p_num, String p_name, String p_photo, String mom_photo, String papa_photo, String gmom_photo,
			String gpapa_photo, String pp_photo, String mp_photo) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_photo = p_photo;
		this.mom_photo = mom_photo;
		this.papa_photo = papa_photo;
		this.gmom_photo = gmom_photo;
		this.gpapa_photo = gpapa_photo;
		this.pp_photo = pp_photo;
		this.mp_photo = mp_photo;
	}

	public PetTreeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
