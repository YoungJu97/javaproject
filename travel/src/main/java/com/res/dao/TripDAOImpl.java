package com.res.dao;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.res.vo.PageVO;
import com.res.vo.TVVO;

@Repository
public class TripDAOImpl implements IF_tripDAO {
	private static String mapperQuery = "com.res.dao.IF_tripDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insert(TVVO tvo) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery + ".insertAll", tvo);
	}

	@Override
	public int getTotalcnt() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".totalcnt");
	}

	@Override
	public List<TVVO> selectList(PageVO pagevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".selectAll", pagevo);
	}

	@Override
	public void updateCnt(String tvo) {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery + ".updateCnt", tvo);
	}

	@Override
	public TVVO selectOne(String no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".selectOne", no);
	}

	@Override
	public void deleteNum(String tvo) {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery + ".deleteNum", tvo);
	}

	@Override
	public void update(TVVO tvvo) {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery + ".updateOne", tvvo);
	}

	@Override
	public int savefilenames(String fname) {
		// TODO Auto-generated method stub
		return sqlSession.insert(mapperQuery + ".saveFile", fname);
	}

	@Override
	public List<String> getFileNames(String tvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".selectFiles", tvo);
	}

	@Override
	public void deleteFnum(String filename) {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery + ".deleteFile", filename);
	}

	@Override
	public int addfilenames(String fname, int viewNum) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<>();
		params.put("fname", fname);
		params.put("viewNum", viewNum);
		return sqlSession.insert(mapperQuery + ".addFile", params);
	}

	@Override
	public List<TVVO> selectListByRegion(PageVO pagevo) {
		Map<String, Object> map = new HashMap<>();
		map.put("pagevo", pagevo);
		map.put("startNo", pagevo.getStartNo());
		map.put("endNo", pagevo.getEndNo());
		map.put("region", pagevo.getRegion()); // Assuming you have a getRegion() method in PageVO

		return sqlSession.selectList(mapperQuery + ".selectListByRegion", map);
	}

	@Override
	public int getRegioncnt(String region) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".regionCnt", region);
	}

}
