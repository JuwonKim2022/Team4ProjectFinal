package com.kh.vo;

import java.util.Date;

public class BoardVO {
	
	private int bno;
	private int member_no;
	private String title;
	private String content;
	private String name;
	private Date regdate;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", member_no=" + member_no + ", title=" + title + ", content=" + content
				+ ", name=" + name + ", regdate=" + regdate + "]";
	}
	
	

}
