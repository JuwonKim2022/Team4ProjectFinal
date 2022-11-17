package com.kh.service;

import com.kh.vo.MemberVO;

public interface MemberService {
	
	//로그인
	public MemberVO login(String vo) throws Exception;
	
	//아이디 찾기
	public MemberVO findId(MemberVO vo) throws Exception;
	
}