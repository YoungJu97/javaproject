package com.res.service;

import java.util.List;

import com.res.vo.ReservAnswerVO;
import com.res.vo.ReservVO;
import com.res.vo.RpageVO;

public interface IF_accService {
	public void insertOne(ReservVO rvo);
	public int getTotalcnt();
	public List<ReservVO> selectAll(RpageVO pagevo);
	public List<String> getFileNames(int passNum);
	public ReservVO selectOne(int acvno);
	public Object getFileNames(String acvno);
	public List<String> getFiles(int acvno);
	public void deleteOne(int dno);
	public void deleteFile(int dno);
	public void deleteFile(String Dfile);
	public void insertAnswer(ReservAnswerVO ravo);
	public List<ReservAnswerVO> selectAnswer(int acvno);
	public void updateOne(ReservVO rvo);
	
}
