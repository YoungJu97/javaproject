package com.epl.soccer;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.epl.file.Fileutil;
import com.epl.service.IF_communityService;
import com.epl.vo.CommunityVO;
import com.epl.vo.CommunityfilesVO;
import com.epl.vo.PageVO;

@Controller
public class ClubcommunityController {
		@Inject
		private IF_communityService communityservice;
		@Inject
		private Fileutil fileutil;
	
		@RequestMapping(value = "clubcommunity", method = RequestMethod.GET)
		public String clubcommunity(Model model,PageVO pagevo) {
			if(pagevo.getPage()==null) {
				pagevo.setPage(1);
			}
			pagevo.setTotalCount(communityservice.selectcnt());
			model.addAttribute("page",pagevo);
			model.addAttribute("community", communityservice.selectcommunity(pagevo));

			
			return "clubcommunity";
		}
		@RequestMapping(value = "selectcommunity", method = RequestMethod.GET)
		public String selectcommunity(Model model,CommunityVO cmtvo) {
			if(cmtvo.getCom_chk()!=null) {
				communityservice.communitychk(cmtvo);
			}
			model.addAttribute("community", communityservice.selectonecommunity(cmtvo));
			model.addAttribute("communityfile",communityservice.selectonefile(cmtvo));
			model.addAttribute("comment",communityservice.selectcomment(cmtvo));
			return "selectcommunity";
		}
		@RequestMapping(value = "communityadd", method = RequestMethod.POST)
		public String communityadd(Model model,CommunityVO cmtvo,MultipartFile file) throws IOException {
			CommunityfilesVO filename = new CommunityfilesVO();
			String image="이미지가없습니다";
			if(!file.isEmpty()) {	
				filename.setcom_filename(fileutil.communityUpload(file,cmtvo.getCom_id()));	
				}else {
				filename.setcom_filename(image);		
				}
			communityservice.insertcommunity(cmtvo);
			communityservice.insertfile(filename);
			
			return "redirect:clubcommunity";
		}
		@RequestMapping(value = "communitymodify", method = RequestMethod.POST)
		public String communitymodify(Model model,@RequestParam("previousimage") String image,CommunityVO cmtvo,MultipartFile file) throws IOException {
			CommunityfilesVO filename = new CommunityfilesVO();
			filename.setcom_num(cmtvo.getCom_num());
			if(!file.isEmpty()) {	
			filename.setcom_filename(fileutil.communityUpload(file,cmtvo.getCom_id()));
			}else {
			filename.setcom_filename(image);
			}
			communityservice.communitymodify(cmtvo);
			communityservice.communitymodifyfile(filename);
			return "redirect:selectcommunity?com_num="+cmtvo.getCom_num();
		}
		@RequestMapping(value = "communitydelete", method = RequestMethod.GET)
		public String communitydelete(Model model,CommunityVO cmtvo) {
			communityservice.communitydelete(cmtvo);

			return "redirect:clubcommunity";
		}
		
}
		
