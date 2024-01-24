package com.res.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.res.vo.MemberVO;

@Repository
public class MemberDAOImpl implements IF_MemberDAO {
	
	private static String mapperQuery="com.res.dao.IF_galleryDAO";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberVO membervo) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".insertJoin",membervo);
	}

	@Override
	public MemberVO select(String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectId",member_id);
	}

	@Override
	public void update(MemberVO membervo) {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".updateMember", membervo);
	}

	
}
