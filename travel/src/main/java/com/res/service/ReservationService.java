package com.res.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.res.dao.IF_ReservationDAO;
import com.res.vo.ReservationVO;

@Service
public class ReservationService implements IF_ReservationService {

	@Inject
	IF_ReservationDAO reservationdao;

	@Override
	public void insertRes(ReservationVO rvo) {
		// TODO Auto-generated method stub
		reservationdao.insertRes(rvo);
	}

	@Override
	public List<ReservationVO> selectRank() {
		// TODO Auto-generated method stub
		return reservationdao.selectRank();
	}

	@Override
	public List<ReservationVO> selectChk(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return reservationdao.selectChk(rvo);
	}
}
