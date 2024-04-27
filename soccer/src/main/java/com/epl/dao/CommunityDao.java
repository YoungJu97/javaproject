package com.epl.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.epl.vo.CommentVO;
import com.epl.vo.CommunityVO;
import com.epl.vo.CommunityfilesVO;
import com.epl.vo.EpluserVO;
import com.epl.vo.PageVO;

@Repository
public class CommunityDao implements IF_communityDao {

	private static String mapperQuery="com.epl.dao.IF_communityDAO";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<CommunityVO> selectcommunity(PageVO pagevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectcommunity",pagevo);
	}

	@Override
	public void insertcommunity(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".communityadd",cmtvo);
	}

	@Override
	public void insertfile(CommunityfilesVO filename) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".communityfile",filename);
	}

	@Override
	public CommunityVO selectonecommunity(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectonecommunity", cmtvo);
	}

	@Override
	public CommunityfilesVO selectonefile(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectonefile", cmtvo);
	}

	@Override
	public void communitymodify(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".communitymodify",cmtvo);
		
	}

	@Override
	public void communitymodifyfile(CommunityfilesVO filename) {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".communitymodifyfile",filename);
	}

	@Override
	public void communitydelete(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".communitydelete",cmtvo);
		sqlSession.delete(mapperQuery+".communitydeletefile",cmtvo);
	}

	@Override
	public void communitychk(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".communitychk",cmtvo);
	}

	@Override
	public void communitycomment(CommentVO comvo) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".communitycomment",comvo);
	}

	@Override
	public List<CommentVO> selectcomment(CommunityVO cmtvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectcomment",cmtvo);
	}

	@Override
	public int selectcnt() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectCnt");
	}
	

}
