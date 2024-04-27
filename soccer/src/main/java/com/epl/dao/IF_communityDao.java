package com.epl.dao;

import java.util.List;

import com.epl.vo.CommentVO;
import com.epl.vo.CommunityVO;
import com.epl.vo.CommunityfilesVO;
import com.epl.vo.PageVO;
import com.epl.vo.ProductVO;
import com.epl.vo.ProductfilesVO;

public interface IF_communityDao {
	
	public List<CommunityVO> selectcommunity(PageVO pagevo);
	public void insertcommunity(CommunityVO cmtvo);
	public void insertfile(CommunityfilesVO filename);
	public CommunityVO selectonecommunity(CommunityVO cmtvo);
	public CommunityfilesVO selectonefile(CommunityVO cmtvo);
	public void communitymodify(CommunityVO cmtvo);
	public void communitymodifyfile(CommunityfilesVO filename);
	public void communitydelete(CommunityVO cmtvo);
	public void communitychk(CommunityVO cmtvo);
	public void communitycomment(CommentVO comvo);
	public List<CommentVO> selectcomment(CommunityVO cmtvo);
	public int selectcnt();
	
}
