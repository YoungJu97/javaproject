package com.epl.soccer;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.epl.file.Fileutil;
import com.epl.service.IF_shopService;
import com.epl.vo.PageVO;
import com.epl.vo.ProductVO;
import com.epl.vo.ProductfilesVO;
import com.epl.vo.PurchaseVO;

@Controller
public class ClubshopController {
	
	@Inject
	private IF_shopService shopservice;
	
	@Inject
	private Fileutil fileutil;
	
	
		@RequestMapping(value = "clubshop", method = RequestMethod.GET)
		public String clubshop(Model model,PageVO pagevo) {	
			if(pagevo.getPage()==null) {
				pagevo.setPage(2);
			}
			pagevo.setPerPageNum(8);
			pagevo.setTotalCount(shopservice.selectcnt());
			
			model.addAttribute("page",pagevo);
			model.addAttribute("product", shopservice.selectproduct(pagevo));
			model.addAttribute("files", shopservice.selectfile(pagevo));
			return "clubshop";
		}
		@RequestMapping(value = "selectshop", method = RequestMethod.GET)
		public String selectshop(Model model,ProductVO provo) {
			model.addAttribute("product", shopservice.selectioneproduct(provo));
			model.addAttribute("files", shopservice.selectonefile(provo));
			model.addAttribute("productselect", shopservice.product());
			model.addAttribute("filesselect", shopservice.file());

			return "selectshop";
		}
		@RequestMapping(value = "productadd", method = RequestMethod.GET)
		public String productadd(Model model) {	
			return "productadd";
		}
		@RequestMapping(value = "purchase", method = RequestMethod.POST)
		public String purchase(Model model,PurchaseVO purvo,ProductVO provo) {			
			provo.setPro_xl(provo.getPro_xl()-purvo.getPur_xl());
			provo.setPro_l(provo.getPro_l()-purvo.getPur_l());
			provo.setPro_m(provo.getPro_m()-purvo.getPur_m());
			provo.setPro_s(provo.getPro_s()-purvo.getPur_s());			
			shopservice.purchaseadd(purvo);			
			shopservice.sizeupdate(provo);
			
			return "redirect:selectshop?pro_num="+purvo.getPur_pronum();
		}
		@RequestMapping(value = "registration", method = RequestMethod.POST)
		public String registration(Model model,ProductVO provo,MultipartFile pfile) throws IOException {
			shopservice.productadd(provo);
			String filename=fileutil.productUpload(pfile,provo.getPro_id(),provo.getPro_title());	
			ProductfilesVO proname = new ProductfilesVO();
			proname.setPro_filename(filename);
			shopservice.productfile(proname);

				
			return "redirect:clubshop";
		}
		@RequestMapping(value = "purchaselist", method = RequestMethod.GET)
		public String purchaselist(Model model,PurchaseVO purvo) {	
			model.addAttribute("purchase", shopservice.purchaselist(purvo));
			
			return "purchaselist";
		}
		@RequestMapping(value = "refund", method = RequestMethod.GET)
		public String refund(Model model,PurchaseVO purvo) {
			ProductVO provo=new ProductVO();
			provo.setPro_num(purvo.getPur_pronum());
			provo=shopservice.selectioneproduct(provo);
			provo.setPro_xl(provo.getPro_xl()+purvo.getPur_xl());
			provo.setPro_l(provo.getPro_l()+purvo.getPur_l());
			provo.setPro_m(provo.getPro_m()+purvo.getPur_m());
			provo.setPro_s(provo.getPro_s()+purvo.getPur_s());
			shopservice.sizeupdate(provo);
			shopservice.purchasedelete(purvo);
			return "redirect:purchaselist?pur_id="+purvo.getPur_id();
		}
}
		
