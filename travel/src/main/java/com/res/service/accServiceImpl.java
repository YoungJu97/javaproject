package com.res.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.res.dao.IF_accDAO;
import com.res.vo.ReservAnswerVO;
import com.res.vo.ReservVO;
import com.res.vo.RpageVO;
import com.res.vo.TempFileVO;

@Service
public class accServiceImpl implements IF_accService{
	
	
	@Inject
	IF_accDAO accdao;
	@Override
	
	public void insertOne(ReservVO rvo) {
		// TODO Auto-generated method stub
		accdao.insertOne(rvo);
		String[] filenames = rvo.getFiles();
//		System.out.println(filenames[0]);
		if( filenames.length > 0) {  // 첨부파일이 있다..
			for(int i=0; i < filenames.length; i++) {
				if(filenames[i]!=null) {
					accdao.savefilenames(filenames[i]);
				}
			}
		}
	}
	
	@Override
	public int getTotalcnt() {
		// TODO Auto-generated method stub
		return accdao.getTotalcnt();
	}
	@Override
	public List<ReservVO> selectAll(RpageVO pagevo) {
		// TODO Auto-generated method stub
		return accdao.selectAll(pagevo);
	}
	@Override
	public List<String> getFileNames(int passNum) {
		// TODO Auto-generated method stub
		return accdao.getFileNames(passNum);
	}
	@Override
	public ReservVO selectOne(int acvno) {
		// TODO Auto-generated method stub
		return accdao.selectOne(acvno);
	}
	@Override
	public Object getFileNames(String acvno) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<String> getFiles(int acvno) {
		// TODO Auto-generated method stub
		return accdao.getfiles(acvno);
	}
	@Override
	public void deleteOne(int dno) {
		accdao.deleteOne(dno);
		
	}
	@Override
	public void deleteFile(int dno) {
		accdao.deleteFile(dno);
		
	}
	@Override
	public void deleteFile(String Dfile) {
		accdao.deleteFile(Dfile);
	}
	@Override
	public void insertAnswer(ReservAnswerVO ravo) {
		accdao.insertAnswer(ravo);
		
	}
	
	@Override
	public List<ReservAnswerVO> selectAnswer(int acvno) {
		return accdao.selectAnswer(acvno);
	}
	@Override
	public void updateOne(ReservVO rvo) {
		accdao.updateOne(rvo);
		TempFileVO tfvo = new TempFileVO();
		int num = rvo.getAccNum();
			String[] files = rvo.getFiles();
			for(int i=0; i<files.length; i++) {
				if(files[i]!=null) {
					tfvo.setAccNum(num);
					tfvo.setAccFileName(files[i]);
					accdao.updateFile(tfvo);
					System.out.println(tfvo.getAccNum());
					System.out.println(tfvo.getAccFileName());
				}
			}
	}

}
