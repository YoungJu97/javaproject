package com.res.dao;

import java.util.List;

import com.res.vo.FilesVO;
import com.res.vo.GalleryVO;
import com.res.vo.GcommentVO;
import com.res.vo.PageVO;


public interface IF_galleryDAO {
	public void galleryinsert(GalleryVO gallervo);
	public void galleryfile(String filename);
	public List<GalleryVO>  selectAll(PageVO pagevo);
	public int selectCnt();
	public List<FilesVO> selectfile(String filenum);
	public List<FilesVO> selectImg(GalleryVO gallervo);
	public void updateCnt(GalleryVO gallervo);
	public GalleryVO selectDetail(GalleryVO gallervo);
	public void updateText(GalleryVO gallervo);
	public void deleteImg(String img_name);
	public void updateFile(FilesVO filevo);
	public void commentinsert(GcommentVO cmt);
	public List<GcommentVO> selectCmt(GalleryVO gallervo);
	public int updategood(GalleryVO gallervo);
	public void deleteText(GalleryVO gallervo);
	public List<GalleryVO> selectReg(PageVO pagevo);
	;
}
