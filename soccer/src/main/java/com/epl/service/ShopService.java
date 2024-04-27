package com.epl.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.epl.dao.IF_shopDao;
import com.epl.vo.ProductfilesVO;
import com.epl.vo.PageVO;
import com.epl.vo.ProductVO;
import com.epl.vo.PurchaseVO;
@Service
public class ShopService implements IF_shopService {
	
	@Inject
	private IF_shopDao shopdao;

	@Override
	public void productadd(ProductVO provo) {
		// TODO Auto-generated method stub
		shopdao.productadd(provo);
	}

	@Override
	public void productfile(ProductfilesVO proname) {
		// TODO Auto-generated method stub
		shopdao.productfile(proname);
		
	}

	@Override
	public List<ProductVO> selectproduct(PageVO pagevo) {
		// TODO Auto-generated method stub
		return shopdao.selectproduct(pagevo);
	}

	@Override
	public List<ProductfilesVO> selectfile(PageVO pagevo) {
		// TODO Auto-generated method stub
		return shopdao.selectfile(pagevo);
	}

	@Override
	public ProductVO selectioneproduct(ProductVO provo) {
		// TODO Auto-generated method stub
		return shopdao.selectoneproduct(provo);
	}

	@Override
	public ProductfilesVO selectonefile(ProductVO provo) {
		// TODO Auto-generated method stub
		return shopdao.selectonefile(provo);
	}

	@Override
	public void purchaseadd(PurchaseVO purvo) {
		// TODO Auto-generated method stub
		shopdao.purchaseadd(purvo);
	}

	@Override
	public List<PurchaseVO> purchaselist(PurchaseVO purvo) {
		// TODO Auto-generated method stub
		return shopdao.purchaselist(purvo);
	}

	@Override
	public void purchasedelete(PurchaseVO purvo) {
		// TODO Auto-generated method stub
		shopdao.purchasedelete(purvo);
	}

	@Override
	public void sizeupdate(ProductVO provo) {
		// TODO Auto-generated method stub
		shopdao.sizeupdate(provo);
	}

	@Override
	public List<ProductfilesVO> file() {
		// TODO Auto-generated method stub
		return shopdao.file();
	}

	@Override
	public List<ProductVO> product() {
		// TODO Auto-generated method stub
		return shopdao.product();
	}

	@Override
	public int selectcnt() {
		// TODO Auto-generated method stub
		return shopdao.selectcnt();
	}
	

	

}
