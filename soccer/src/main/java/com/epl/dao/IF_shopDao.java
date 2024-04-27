package com.epl.dao;

import java.util.List;

import com.epl.vo.ProductfilesVO;
import com.epl.vo.PageVO;
import com.epl.vo.ProductVO;
import com.epl.vo.PurchaseVO;

public interface IF_shopDao {
	public int selectcnt();
	public List<ProductfilesVO> file();
	public  List<ProductVO> product();
	public void productadd(ProductVO provo);
	public void productfile(ProductfilesVO proname);
	public List<ProductVO> selectproduct(PageVO pagevo);
	public List<ProductfilesVO> selectfile(PageVO pagevo);
	public ProductVO selectoneproduct(ProductVO provo);
	public ProductfilesVO selectonefile(ProductVO provo);
	public void purchaseadd(PurchaseVO purvo);
	public void sizeupdate(ProductVO provo);
	public List<PurchaseVO> purchaselist(PurchaseVO purvo);
	public void purchasedelete(PurchaseVO purvo);
	
}
