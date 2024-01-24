package com.res.service;

import java.util.List;

import com.res.vo.ReservationVO;

public interface IF_ReservationService {
	public void insertRes(ReservationVO rvo);
	public List<ReservationVO> selectRank();
	public List<ReservationVO> selectChk(ReservationVO rvo);
}
