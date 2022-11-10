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
	public List<HistoryDTO> selectAll() throws Exception {
		return sqlSession.selectList(NameSpace + ".selectAll");
	}
	
	@Override
	public List<HistoryDTO> selectRecentHistory(int membernumber) throws Exception {
		return sqlSession.selectList(NameSpace + ".selectRecentHistory", membernumber);
	}
	
	@Override
	public int insertSearchBox(HistoryDTO historyDTO) throws Exception {
		return sqlSession.insert(NameSpace + ".insertSearchBoxSearchData", historyDTO);
	}
	
	@Override
	public int insertPolygon(HistoryDTO historyDTO) throws Exception {
		return sqlSession.insert(NameSpace + ".insertPolygonSearchData", historyDTO);
	}
}
