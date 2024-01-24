package com.res.dao;

import com.res.vo.MemberVO;


public interface IF_MemberDAO {
	public void insert(MemberVO membervo);
	public MemberVO select(String member_id);
	public void update(MemberVO membervo);
	
}
