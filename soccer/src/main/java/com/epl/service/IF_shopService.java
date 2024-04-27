package com.epl.service;

import java.util.List;

import com.epl.vo.ProductfilesVO;
import com.epl.vo.PageVO;
import com.epl.vo.ProductVO;
import com.epl.vo.PurchaseVO;


public interface IF_shopService {
	public int selectcnt();
	public void productadd(ProductVO provo);
	public void productfile(ProductfilesVO proname);
	public List<ProductVO> selectproduct(PageVO pagevo);
	public List<ProductfilesVO> selectfile(PageVO pagevo);
	public ProductVO selectioneproduct(ProductVO provo);
	public List<ProductfilesVO> file();
	public  List<ProductVO> product();
	public ProductfilesVO selectonefile(ProductVO provo);
	public void purchaseadd(PurchaseVO purvo);
	public List<PurchaseVO> purchaselist(PurchaseVO purvo);
	public void purchasedelete(PurchaseVO purvo);
	public void sizeupdate(ProductVO provo);
}
