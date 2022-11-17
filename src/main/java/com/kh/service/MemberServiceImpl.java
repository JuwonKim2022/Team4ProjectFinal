package com.kh.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dao.MemberDAO;
import com.kh.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	//로그인
	@Override
	public MemberVO login(String vo) throws Exception {
		return dao.login(vo);
	}
	
	// 아이디 찾기
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		return dao.findId(vo);
	}
}