package com.kh.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.vo.HistoryDTO;

@Repository("historyDAO")
public class HistoryDAOImpl implements HistoryDAO {

	@Autowired
	private SqlSession sqlSession;
	private String NameSpace = "HistoryMapper";

	@Override
	public List<HistoryDTO> selectRecentHistory(int member_no) throws Exception {
		return sqlSession.selectList(NameSpace + ".selectRecentHistory", member_no);
	}

	@Override
	public List<HistoryDTO> selectAllRecentHistory(int member_no) throws Exception {
		return sqlSession.selectList(NameSpace + ".selectAllRecentHistory", member_no);
	}

	@Override
	public int insertSearchBox(HistoryDTO historyDTO) throws Exception {
		return sqlSession.insert(NameSpace + ".insertSearchBoxSearchData", historyDTO);
	}

}
