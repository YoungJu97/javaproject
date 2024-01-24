package com.res.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.res.vo.ReservationVO;
@Repository
public class ReservationDAOImpl implements IF_ReservationDAO {
	
private static String mapperQuery="com.res.dao.IF_galleryDAO";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertRes(ReservationVO rvo) {
		sqlSession.insert(mapperQuery+".insertRes",rvo);
		
	}

	@Override
	public List<ReservationVO> selectRank() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectRank");
	}

	@Override
	public List<ReservationVO> selectChk(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectChk",rvo);
	}
}
