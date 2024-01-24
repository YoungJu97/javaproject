package com.res.travel;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.res.service.IF_MemberService;
import com.res.service.IF_galleryService;
import com.res.util.FileDataUtil;
import com.res.vo.FilesVO;
import com.res.vo.GalleryVO;
import com.res.vo.GcommentVO;
import com.res.vo.PageVO;


@Controller
public class GalleryController {
	
	@Inject
	private IF_galleryService galleryservice;
	@Inject
	private IF_MemberService memberservice;
	@Inject
	FileDataUtil fileutil;
	
	@RequestMapping(value = "gallery", method = RequestMethod.GET)
	public String gallery( Model model,PageVO pagevo) {
		pagevo.setPerPageNum(6);
		if(pagevo.getPage()==null) {
			pagevo.setPage(1);
		}
		pagevo.setTotalCount(galleryservice.selectCnt());
		List<GalleryVO> glist=galleryservice.selectAll(pagevo);
		List<FilesVO> filelist = new ArrayList<FilesVO>(); 
		for(int i=0 ;i<glist.size();i++) {	
			List<FilesVO> flist=galleryservice.selectfile(glist.get(i).getGallery_num());
			if(flist!=null) {
				for(FilesVO fvo : flist) {
					filelist.add(fvo);
					break;			
				}
			}
		}
		model.addAttribute("file", filelist);
		model.addAttribute("glist",glist);
		model.addAttribute("page",pagevo);
		return "gallery";
	}
	@RequestMapping(value = "gwrite", method = RequestMethod.GET)
	public String write( Model model) {
		
		
		return "g_write";
	}
	@RequestMapping(value = "galleryview", method = RequestMethod.POST) 
	public String galleryview( Model model ,GalleryVO gallervo,MultipartFile[] file) throws Exception {
		
		String[] datafile=fileutil.fileUpload(file);

		gallervo.setFiles(datafile);
		
		galleryservice.galleryinsert(gallervo);
		return "redirect:gallery";
	}
	@RequestMapping(value = "detailview", method = RequestMethod.GET)
	public String detailview( Model model,GalleryVO gallervo
			,@CookieValue(name="user_id") String userid) {
		galleryservice.updateCnt(gallervo);
		GalleryVO gvo=galleryservice.selectDetail(gallervo);
		List<FilesVO> flist=galleryservice.selectImg(gallervo);
		List<GcommentVO> gcmtlist=galleryservice.selectCmt(gallervo);
		model.addAttribute("cookie_id",userid);
		model.addAttribute("gcmt",gcmtlist);
		model.addAttribute("gvo",gvo);
		model.addAttribute("flist",flist);
		return "detailview";
	}
	@RequestMapping(value = "viewmod", method = RequestMethod.GET)
	public String viewmod( Model model,GalleryVO gallervo) {
		
		GalleryVO gvo=galleryservice.selectDetail(gallervo);
		List<FilesVO> flist=galleryservice.selectImg(gallervo);
		model.addAttribute("gvo",gvo);
		model.addAttribute("flist",flist);
		
		
		return "viewmod";
	}
	@RequestMapping(value = "gallerymod", method = RequestMethod.POST)
	public String gallerymod( Model model,GalleryVO gallervo,MultipartFile[] file) throws IOException {
		
		String[] datafile=fileutil.fileUpload(file);

		gallervo.setFiles(datafile);
		galleryservice.updateFile(gallervo);
		galleryservice.updateText(gallervo);
		
		return "redirect:detailview?gallery_num="+gallervo.getGallery_num();
	}
	@RequestMapping(value = "textdel", method = RequestMethod.GET)
	public String textdel( GalleryVO gallervo){
		
		galleryservice.deleteText(gallervo);
		
		return "redirect:gallery";
	}
	
}
