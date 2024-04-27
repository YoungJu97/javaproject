package com.epl.dao;

import java.util.List;

import com.epl.vo.EpluserVO;

public interface IF_loginDao {
	
	public void join(EpluserVO epluser);
	public EpluserVO selectid(EpluserVO uservo);
	public List<EpluserVO> select();
	public void passchange(EpluserVO epluser);
}
