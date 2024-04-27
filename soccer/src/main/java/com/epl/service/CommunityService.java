package com.epl.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.epl.dao.IF_communityDao;
import com.epl.vo.CommentVO;
import com.epl.vo.CommunityVO;
import com.epl.vo.CommunityfilesVO;
import com.epl.vo.PageVO;
@Service
public class CommunityService implements IF_communityService {
	
	@Inject
	private IF_communityDao communitydao;

	@Override
	public List<CommunityVO> selectcommunity(PageVO pagevo) {
		// TODO Auto-generated method stub
		return communitydao.selectcommunity(pagevo);
	}

	@Override
	public void insertcommunity(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		communitydao.insertcommunity(cmtvo);
	}

	@Override
	public void insertfile(CommunityfilesVO filename) {
		// TODO Auto-generated method stub
		communitydao.insertfile(filename);
	}

	@Override
	public CommunityVO selectonecommunity(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		return communitydao.selectonecommunity(cmtvo);
	}

	@Override
	public CommunityfilesVO selectonefile(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		return communitydao.selectonefile(cmtvo);
	}

	@Override
	public void communitymodify(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		communitydao.communitymodify(cmtvo);
	}

	@Override
	public void communitymodifyfile(CommunityfilesVO filename) {
		// TODO Auto-generated method stub
		communitydao.communitymodifyfile(filename);
	}

	@Override
	public void communitydelete(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		communitydao.communitydelete(cmtvo);
	}

	@Override
	public void communitychk(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		communitydao.communitychk(cmtvo);
	}

	@Override
	public void communitycomment(CommentVO comvo) {
		// TODO Auto-generated method stub
		communitydao.communitycomment(comvo);
	}

	@Override
	public List<CommentVO> selectcomment(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		return communitydao.selectcomment(cmtvo);
	}

	@Override
	public int selectcnt() {
		// TODO Auto-generated method stub
		return communitydao.selectcnt();
	}
	

}
