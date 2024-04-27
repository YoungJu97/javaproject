package com.epl.service;

import java.util.List;

import com.epl.vo.EpluserVO;


public interface IF_loginService {
	public void join(EpluserVO uservo);
	public EpluserVO selectid(EpluserVO uservo);
	public List<EpluserVO> select();
	public void passchange(EpluserVO epluser);
}
