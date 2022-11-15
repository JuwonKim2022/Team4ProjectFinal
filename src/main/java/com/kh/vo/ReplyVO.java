package com.kh.vo;

import java.util.Date;

public class ReplyVO {

	private int bno;
	private int rno;
	private int member_no;
	private String content;
	private String name;
	private Date regdate;
	
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
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

	//member_no는 제외한 상태
	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" + rno + ", member_no=" + member_no + ", content=" + content + ", name="
				+ name + ", regdate=" + regdate + "]";
	}


	




	
	
}