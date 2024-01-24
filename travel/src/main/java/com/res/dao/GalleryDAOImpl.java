package com.res.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.res.vo.FilesVO;
import com.res.vo.GalleryVO;
import com.res.vo.GcommentVO;
import com.res.vo.PageVO;


@Repository
public class GalleryDAOImpl implements IF_galleryDAO{
	
	private static String mapperQuery="com.res.dao.IF_galleryDAO";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void galleryinsert(GalleryVO galleryvo) {
	
		sqlSession.insert(mapperQuery+".insertOne",galleryvo);
	}

	@Override
	public void galleryfile(String filename) {
		sqlSession.insert(mapperQuery+".saveFile",filename);
		
	}

	@Override
	public List<GalleryVO>  selectAll(PageVO pagevo) {
		return sqlSession.selectList(mapperQuery+".selectAll",pagevo);
		
	}

	@Override
	public int selectCnt() {
		
		return sqlSession.selectOne(mapperQuery+".selectCnt");
	}

	@Override
	public List<FilesVO> selectfile(String filenum){
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectFile",filenum);
	}

	@Override
	public List<FilesVO> selectImg(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectImg", galleryvo);
	}

	@Override
	public void updateCnt(GalleryVO galleryvo) {
		sqlSession.update(mapperQuery+".updateCnt",galleryvo);
		
	}

	@Override
	public GalleryVO selectDetail(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectText",galleryvo);
	}

	@Override
	public void updateText(GalleryVO galleryvo) {
		sqlSession.update(mapperQuery+".updateText",galleryvo);
		
	}

	@Override
	public void deleteImg(String img_name) {
		sqlSession.delete(mapperQuery+".deleteImg",img_name);
		
	}

	@Override
	public void updateFile(FilesVO filevo) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".updateFile",filevo);
	}

	@Override
	public void commentinsert(GcommentVO cmt) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".insertComment",cmt);
	}

	@Override
	public List<GcommentVO> selectCmt(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectCmt",galleryvo);
	}

	@Override
	public int updategood(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		return sqlSession.update(mapperQuery+".updateGood",galleryvo);
	}

	@Override
	public void deleteText(GalleryVO galleryvo) {
		sqlSession.delete(mapperQuery+".deleteText",galleryvo);
		sqlSession.delete(mapperQuery+".deleteImgnum",galleryvo);
		sqlSession.delete(mapperQuery+".deleteCmt",galleryvo);
		
	}

	@Override
	public List<GalleryVO> selectReg(PageVO pagevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectRegion",pagevo);
	}

	

	
	

	

	

	

}
