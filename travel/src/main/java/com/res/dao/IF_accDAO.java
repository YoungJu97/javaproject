package com.res.dao;

import java.util.List;

import com.res.vo.ReservAnswerVO;
import com.res.vo.ReservVO;
import com.res.vo.RpageVO;
import com.res.vo.TempFileVO;

public interface IF_accDAO {
	public void insertOne(ReservVO rvo);
	public void savefilenames(String fname);
	public int getTotalcnt();
	public List<ReservVO> selectAll(RpageVO pagevo);
	public List<String> getFileNames(int passNum);
	public ReservVO selectOne(int acvno);
	public List<String> getfiles(int acvno);
	public void deleteOne(int dno);
	public void deleteFile(int dno);
	public void deleteFile(String dfile);
	public void insertAnswer(ReservAnswerVO ravo);
	public List<ReservAnswerVO> selectAnswer(int acvno);
	public void updateOne(ReservVO rvo);
	public void updateFile(TempFileVO tfvo);
	
}
