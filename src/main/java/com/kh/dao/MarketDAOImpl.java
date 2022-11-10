package com.kh.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.vo.MarketDTO;

@Repository("marketDAO")
public class MarketDAOImpl implements MarketDAO {
	@Autowired
	private SqlSession sqlSession;
	private String NameSpace = "MarketMapper";

	@Override
	public List<MarketDTO> selectAll() throws Exception {
		return sqlSession.selectList(NameSpace + ".selectAll");
	}

	@Override
	public List<MarketDTO> selectByDistrict(String district) throws Exception {
		return sqlSession.selectList(NameSpace + ".selectByDistrict", district);
	}
	
	@Override
	public String returnDistrict(String bd_codename) throws Exception {
		return sqlSession.selectOne(NameSpace + ".returnDistrict", bd_codename);
	}
	
	@Override
	public List<MarketDTO> selectDataByDYQ(String district) throws Exception {
		return sqlSession.selectList(NameSpace + ".selectDataByDYQ", district);
	}
	
	@Override
	public List<MarketDTO> selectRData(String district) throws Exception {
		return sqlSession.selectList(NameSpace + ".selectRData", district);
	}

}
