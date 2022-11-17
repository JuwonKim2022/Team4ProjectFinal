package com.kh.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;

	// 로그인
	@Override
	public MemberVO login(String vo) throws Exception {

		return sql.selectOne("memberMapper.login", vo);
	}

	// 아이디 찾기
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {

		return sql.selectOne("memberMapper.findId", vo);
	}

}