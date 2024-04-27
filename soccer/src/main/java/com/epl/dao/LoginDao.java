package com.epl.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.epl.vo.EpluserVO;

@Repository
public class LoginDao implements IF_loginDao {

	private static String mapperQuery="com.epl.dao.IF_loginDAO";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void join(EpluserVO epluser) {
		sqlSession.insert(mapperQuery+".joininsert",epluser);
		
	}
	@Override
	public List<EpluserVO> select() {
		
		return sqlSession.selectList(mapperQuery+".selectevery");
	}
	@Override
	public EpluserVO selectid(EpluserVO uservo) {
		
		return sqlSession.selectOne(mapperQuery+".selectid",uservo);
	}
	@Override
	public void passchange(EpluserVO epluser) {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".updatepass",epluser);
	}

}
