package com.kh.vo;

import java.util.Date;

public class MemberVO {

	private String singNumber ;
	private String name;
	private String id;
	private String pw;
	private String email;
	private Date regData;
	private int adminCheck;
	
	public MemberVO() {
	}

	public MemberVO(String singNumber, String name, String id, String pw, String email, Date regData, int adminCheck) {
		super();
		this.singNumber = singNumber;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.regData = regData;
		this.adminCheck = adminCheck;
	}
	

	public String getSingNumber() {
		return singNumber;
	}

	public void setSingNumber(String singNumber) {
		this.singNumber = singNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegData() {
		return regData;
	}

	public void setRegData(Date regData) {
		this.regData = regData;
	}

	public int getAdminCheck() {
		return adminCheck;
	}

	public void setAdminCheck(int adminCheck) {
		this.adminCheck = adminCheck;
	}

	@Override
	public String toString() {
		return "UserVO [singNumber=" + singNumber + ", name=" + name + ", id=" + id + ", pw="
				+ pw + ", email=" + email + ", regData=" + regData + ", adminCheck=" + adminCheck +"]";
	}
	
}