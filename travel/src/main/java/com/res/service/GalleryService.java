package com.res.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.res.dao.IF_galleryDAO;
import com.res.vo.FilesVO;
import com.res.vo.GalleryVO;
import com.res.vo.GcommentVO;
import com.res.vo.PageVO;


@Service
public class GalleryService implements IF_galleryService {
	
	@Inject
	private IF_galleryDAO gallerydao;
	
	@Override
	public void galleryinsert(GalleryVO galleryvo) {
		gallerydao.galleryinsert(galleryvo);
		String[] filenames = galleryvo.getFiles();
		if(filenames.length>0) { 
			for(int i=0 ; i< filenames.length;i++) {			
				if(filenames[i]!=null) {
					gallerydao.galleryfile(filenames[i]);
				}
			}
		}
	}

	@Override
	public void galleryfile(GalleryVO galleryvo) {
		
	}
	

	@Override
	public List<GalleryVO>  selectAll(PageVO pagevo) {
		
		return gallerydao.selectAll(pagevo);
		
	}

	@Override
	public int selectCnt() {
		
		return gallerydao.selectCnt();
	}

	@Override
	public List<FilesVO> selectfile(String filenum) {
		// TODO Auto-generated method stub
		return gallerydao.selectfile(filenum);
	}

	@Override
	public List<FilesVO> selectImg(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		return gallerydao.selectImg(galleryvo);
	}

	@Override
	public void updateCnt(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		gallerydao.updateCnt(galleryvo);
	}

	@Override
	public GalleryVO selectDetail(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		return gallerydao.selectDetail(galleryvo);
	}

	@Override
	public void updateText(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		gallerydao.updateText(galleryvo);
	}

	@Override
	public void deleteImg(String img_name) {
		// TODO Auto-generated method stub
		gallerydao.deleteImg(img_name);
	}

	@Override
	public void updateFile(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		String[] filenames = galleryvo.getFiles();
		FilesVO fvo = new FilesVO();
		if(filenames.length>0) { 
			for(int i=0 ; i< filenames.length;i++) {
				if(filenames[i]!=null) {
					fvo.setFiles_num(galleryvo.getGallery_num());
					fvo.setGallery_filename(filenames[i]);
					gallerydao.updateFile(fvo);
				}
			}
		}
	}

	@Override
	public void commentinsert(GcommentVO cmt) {
		// TODO Auto-generated method stub
		gallerydao.commentinsert(cmt);
	}

	@Override
	public List<GcommentVO> selectCmt(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		return gallerydao.selectCmt(galleryvo);
	}

	@Override
	public int updategood(GalleryVO galleryvo) {
		
		return gallerydao.updategood(galleryvo);
	}

	@Override
	public void deleteText(GalleryVO galleryvo) {
		// TODO Auto-generated method stub
		gallerydao.deleteText(galleryvo);
	}

	@Override
	public List<GalleryVO> selectReg(PageVO pagevo) {
		// TODO Auto-generated method stub
		return gallerydao.selectReg(pagevo);
	}

	

	
	




	

	

}
