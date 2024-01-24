package com.res.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.res.dao.IF_MemberDAO;
import com.res.dao.IF_galleryDAO;
import com.res.vo.MemberVO;

@Service
public class MemberService implements IF_MemberService {
	
	@Inject
	private  IF_MemberDAO memberdao;
	
	@Override
	public void insert(MemberVO membervo) {
		// TODO Auto-generated method stub
		memberdao.insert(membervo);
	}

	@Override
	public MemberVO select(String member_id) {
		// TODO Auto-generated method stub
		return memberdao.select(member_id);
	}

	@Override
	public void update(MemberVO membervo) {
		// TODO Auto-generated method stub
		memberdao.update(membervo);
	}

	

}
