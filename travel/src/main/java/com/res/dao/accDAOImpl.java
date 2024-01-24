package com.res.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.res.vo.ReservAnswerVO;
import com.res.vo.ReservVO;
import com.res.vo.RpageVO;
import com.res.vo.TempFileVO;

@Repository
public class accDAOImpl implements IF_accDAO{
	
	private static String mapperQuery="com.res.dao.IF_accDAO";
	
	@Inject
	private SqlSession sqlSession;
	 
	@Override
	public void insertOne(ReservVO rvo) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".insert",rvo);
		
	}
	@Override
	public int getTotalcnt() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".totalcnt");
		
	}
	@Override
	public List<ReservVO> selectAll(RpageVO pagevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectAll",pagevo);
	}
	@Override
	public void savefilenames(String fname) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".saveFile", fname);
	}
	@Override
	public List<String> getFileNames(int passNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".getFile", passNum);
	}
	@Override
	public ReservVO selectOne(int acvno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectOne", acvno);
	}
	@Override
	public List<String> getfiles(int acvno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".getFiles", acvno);
	}
	@Override
	public void deleteOne(int dno) {
		sqlSession.delete(mapperQuery+".deleteOne", dno);
	}
	@Override
	public void deleteFile(int dno) {
		sqlSession.delete(mapperQuery+".deleteFile", dno);
	}
	@Override
	public void deleteFile(String dfile) {
//		sqlSession.delete(mapperQuery, parameter)
		sqlSession.delete(mapperQuery+".deleteFile2",dfile);
		
		
	}
	@Override
	public void insertAnswer(ReservAnswerVO ravo) {
		sqlSession.insert(mapperQuery+".insertAnswer", ravo);
		
	}
	@Override
	public List<ReservAnswerVO> selectAnswer(int acvno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectAnswer", acvno);
	}
	@Override
	public void updateOne(ReservVO rvo) {
		sqlSession.update(mapperQuery+".updateOne", rvo);
		
	}
	@Override
	public void updateFile(TempFileVO tfvo) {
		sqlSession.insert(mapperQuery+".updateFile", tfvo);
	}
	
	

}
