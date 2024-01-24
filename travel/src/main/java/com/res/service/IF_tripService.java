package com.res.service;

import java.util.List;

import com.res.vo.PageVO;
import com.res.vo.TVVO;

public interface IF_tripService {

	public void insertline(TVVO tvvo);

	public List<TVVO> selectList(PageVO pagevo);

	public TVVO detailview(String tvo);

	public int getTotalcnt();

	public void deleteNum(String tvo);

	public TVVO selectOne(String tvo);

	public void update(TVVO tvvo);

	public List<String> getFileNames(String tvo);

	public void deleteFnum(String filename);

	public List<TVVO> selectListByRegion(PageVO pagevo);

	public int getRegionCnt(String region);

}
