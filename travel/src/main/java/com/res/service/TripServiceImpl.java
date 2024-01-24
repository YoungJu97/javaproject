package com.res.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.res.dao.IF_tripDAO;
import com.res.util.FileDataUtil;
import com.res.vo.PageVO;
import com.res.vo.TVVO;

@Service
public class TripServiceImpl implements IF_tripService{
	@Inject
	IF_tripDAO tripdao;
	


	@Override
	public void insertline(TVVO tvvo) {
		tripdao.insert(tvvo);
		String[] fileNames = tvvo.getFiles();
		if (fileNames != null && fileNames.length > 0) {
	        for (int i = 0; i < fileNames.length; i++) {
	            if (fileNames[i] != null) { // 각 파일명이 null이 아닌 경우에만 저장
	                tripdao.savefilenames(fileNames[i]);
	            }
	        }
	    } else { // fileNames가 null인 경우도 파일명 저장 가능하도록 추가
	        tripdao.savefilenames(null); // 또는 다른 기본값으로 설정하여 저장 가능
	    }
	}

	@Override
	public int getTotalcnt() {
		// TODO Auto-generated method stub
		return tripdao.getTotalcnt();
	}

	@Override
	public List<TVVO> selectList(PageVO pagevo) {
		// TODO Auto-generated method stub
		return tripdao.selectList(pagevo);
	}

	@Override
	public TVVO detailview(String tvo) {
		// TODO Auto-generated method stub
		tripdao.updateCnt(tvo);
		return tripdao.selectOne(tvo);
	}

	@Override
	public void deleteNum(String tvo) {
		// TODO Auto-generated method stub
		tripdao.deleteNum(tvo);
	}

	@Override
	public TVVO selectOne(String tvo) {
		// TODO Auto-generated method stub
		TVVO a = tripdao.selectOne(tvo);
		return a;
	}

	@Override
	public void update(TVVO tvvo) {
		// TODO Auto-generated method stub
		tripdao.update(tvvo);
		String[] fileNames = tvvo.getFiles();
		if (fileNames != null && fileNames.length > 0) {
	        for (int i = 0; i < fileNames.length; i++) {
	            if (fileNames[i] != null) { // 각 파일명이 null이 아닌 경우에만 저장
	                tripdao.addfilenames(fileNames[i], tvvo.getView_num());
	            }
	        }
	    } else { // fileNames가 null인 경우도 파일명 저장 가능하도록 추가
	        tripdao.addfilenames(null, tvvo.getView_num()); // 또는 다른 기본값으로 설정하여 저장 가능
	    }
	}

	@Override
	public List<String> getFileNames(String tvo) {
		// TODO Auto-generated method stub
		return tripdao.getFileNames(tvo);
	}

	@Override
	public void deleteFnum(String filename) {
		// TODO Auto-generated method stub
		tripdao.deleteFnum(filename);
	}

	@Override
	public List<TVVO> selectListByRegion(PageVO pagevo) {
		// TODO Auto-generated method stub
		return tripdao.selectListByRegion(pagevo);
	}

	@Override
	public int getRegionCnt(String region) {
		// TODO Auto-generated method stub
		return tripdao.getRegioncnt(region);
	}

}
