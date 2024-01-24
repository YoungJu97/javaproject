package com.res.dao;

import java.util.List;

import com.res.vo.PageVO;
import com.res.vo.TVVO;

public interface IF_tripDAO {

	public void insert(TVVO tvo);

	public int getTotalcnt();

	public List<TVVO> selectList(PageVO pagevo);

	public TVVO selectOne(String no);

	public void updateCnt(String tvo);

	public void deleteNum(String tvo);

	public void update(TVVO tvvo);

	public int savefilenames(String fname);

	public List<String> getFileNames(String tvo);

	public void deleteFnum(String filename);

	public int addfilenames(String fname, int view_num);

	public List<TVVO> selectListByRegion(PageVO pagevo);
	
	public int getRegioncnt(String region);
}
