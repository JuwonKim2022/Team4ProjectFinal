package com.kh.dao;

import com.kh.vo.MemberVO;


public interface SignUpDAO {
	   //해당 도메인에 관련된 기능 선언
	   public String getTime();

	   //C: 회원가입
	   public void insertSignUp(MemberVO userVo);


	   //R: 회원 정보 조회 - ID,PW정보에 해당하는 사용자 정보
	   public MemberVO readSignUpWithIDPW(String id,String pw) throws Exception;

	   public MemberVO readSignUp(String id) throws Exception;
	   
	   //메일 변경
	   public MemberVO updateEamil(MemberVO memberVO);
	   //주소 변경
	   public MemberVO updateAddress(MemberVO memberVO);
	}