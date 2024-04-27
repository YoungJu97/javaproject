package com.epl.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.epl.vo.EpluserVO;
import com.epl.vo.PageVO;
import com.epl.vo.ProductfilesVO;
import com.epl.vo.ProductVO;
import com.epl.vo.PurchaseVO;

@Repository
public class ShopDao implements IF_shopDao {

	private static String mapperQuery="com.epl.dao.IF_shopDAO";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void productadd(ProductVO provo) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".shopinsert",provo);
	}

	@Override
	public void productfile(ProductfilesVO proname) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".fileinsert",proname);
	}

	@Override
	public List<ProductVO> selectproduct(PageVO pagevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".shopselectpage",pagevo);
	}

	@Override
	public List<ProductfilesVO> selectfile(PageVO pagevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".fileselectpage",pagevo);
	}
	@Override
	public List<ProductVO> product() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".shopselect");
	}

	@Override
	public List<ProductfilesVO> file() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".fileselect");
	}

	@Override
	public ProductVO selectoneproduct(ProductVO provo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".shoponeselect",provo);
	}

	@Override
	public ProductfilesVO selectonefile(ProductVO provo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".fileoneselect",provo);
	}

	@Override
	public void purchaseadd(PurchaseVO purvo) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".purchaseinsert",purvo);
	}

	@Override
	public List<PurchaseVO> purchaselist(PurchaseVO purvo) {
		// TODO Auto-generated method stub
		if(!purvo.getPur_id().equals("admin")) {	
			return sqlSession.selectList(mapperQuery+".purchaselist",purvo);	
			}else {
			return	sqlSession.selectList(mapperQuery+".adminlist");
			}
	}

	@Override
	public void purchasedelete(PurchaseVO purvo) {
		// TODO Auto-generated method stub
		
		sqlSession.delete(mapperQuery+".purchasedelete",purvo);
		
	
	}

	@Override
	public void sizeupdate(ProductVO provo) {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".sizecntupdate",provo);
	}

	@Override
	public int selectcnt() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectcnt");
	}


	
	
	}


