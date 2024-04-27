package com.epl.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.epl.dao.IF_loginDao;
import com.epl.vo.EpluserVO;
@Service
public class LoginService implements IF_loginService {
	
	@Inject
	private IF_loginDao logindao;
	

	@Override
	public void join(EpluserVO uservo) {
		logindao.join(uservo);
		
	}

	@Override
	public List<EpluserVO> select() {
		
		return logindao.select();
	}


	@Override
	public EpluserVO selectid(EpluserVO uservo) {
		
		return logindao.selectid(uservo);
	}

	@Override
	public void passchange(EpluserVO epluser) {
		// TODO Auto-generated method stub
		logindao.passchange(epluser);
	}

}
