package com.kh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.vo.MarketDTO;
import com.kh.vo.MarketOpenCloseDTO;

@Repository("marketDAO")
public class MarketDAOImpl implements MarketDAO {
	@Autowired
	private SqlSession sqlSession;
	private String NameSpace = "MarketMapper";
	private String NameSpace1 = "MarketOpenCloseMapper";

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
	public List<MarketDTO> selectDataByDYQ(String district, int marketyear, int marketquarter) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("district", district);
		paramMap.put("marketyear", marketyear);
		paramMap.put("marketquarter", marketquarter);

		return sqlSession.selectList(NameSpace + ".selectDataByDYQ", paramMap);
	}

	@Override
	public List<MarketDTO> selectRbargraphData(String district) throws Exception {
		return sqlSession.selectList(NameSpace + ".selectRbargraphData", district);
	}

	@Override
	public List<MarketOpenCloseDTO> selectRpiegraphData(String district) throws Exception {
		return sqlSession.selectList(NameSpace1 + ".selectRpiegraphData", district);
	}

}
