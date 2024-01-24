package com.res.travel;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.res.service.IF_tripService;
import com.res.util.FileDataUtil;
import com.res.vo.PageVO;
import com.res.vo.TVVO;

@Controller
public class TripViewController {
	@Inject
	IF_tripService tripservice;
	@Inject
	FileDataUtil filedataUtil;

	/*
	 * @RequestMapping(value = "tripview", method = RequestMethod.GET) public String
	 * tripview(@RequestParam(name = "region", required = false) String region,
	 * Model model,
	 * 
	 * @ModelAttribute PageVO pagevo) { if (pagevo.getPage() == null) {
	 * pagevo.setPage(1); }
	 * 
	 * // region 정보를 PageVO에 설정 if (region != null) { pagevo.setRegion(region);
	 * pagevo.setTotalCount(tripservice.getRegionCnt(pagevo.getRegion()));
	 * List<TVVO> tvlist = tripservice.selectListByRegion(pagevo);
	 * model.addAttribute("tvlist", tvlist); model.addAttribute("pagevo", pagevo);
	 * 
	 * return "destination"; } pagevo.setTotalCount(tripservice.getTotalcnt());
	 * List<TVVO> tvlist = tripservice.selectList(pagevo);
	 * 
	 * model.addAttribute("tvlist", tvlist); model.addAttribute("pagevo", pagevo);
	 * 
	 * return "destination"; }
	 */

	@RequestMapping(value = "tripview", method = RequestMethod.GET)
	public String tripview(@RequestParam(name = "region", required = false) String region, Model model,
			@ModelAttribute PageVO pagevo) {
		if (pagevo.getPage() == null) {
			pagevo.setPage(1);
		}

		// region 정보를 PageVO에 설정
		if (region != null) {
			return handlePaginationByRegion(region, model, pagevo);
		}

		return handlePaginationForAll(model, pagevo);
	}

	private String handlePaginationByRegion(String region, Model model, PageVO pagevo) {
		pagevo.setRegion(region);
		pagevo.setTotalCount(tripservice.getRegionCnt(pagevo.getRegion()));
		List<TVVO> tvlist = tripservice.selectListByRegion(pagevo);
		model.addAttribute("tvlist", tvlist);
		model.addAttribute("pagevo", pagevo);

		return "destination";
	}

	private String handlePaginationForAll(Model model, PageVO pagevo) {
		pagevo.setTotalCount(tripservice.getTotalcnt());
		List<TVVO> tvlist = tripservice.selectList(pagevo);
		model.addAttribute("tvlist", tvlist);
		model.addAttribute("pagevo", pagevo);

		return "destination";
	}

	@RequestMapping(value = "tripwr", method = RequestMethod.GET)
	public String tripwr(Model model) {
		return "tripwrform";
	}

	@RequestMapping(value = "viewwrpro", method = RequestMethod.POST)
	public String viewwr(Model model, TVVO tvvo, MultipartFile[] file) throws Exception {
		String[] fileNames = filedataUtil.fileUpload(file);
		tvvo.setFiles(fileNames);
		tripservice.insertline(tvvo);
		return "redirect:tripview";
	}

	@RequestMapping(value = "tvdetail", method = RequestMethod.GET)
	public String tvdetail(Model model, @RequestParam("tvo") String tvo) {
		List<String> files = tripservice.getFileNames(tvo);
		model.addAttribute("files", files);
		model.addAttribute("nowvo", tripservice.detailview(tvo));
		return "view";
	}

	@RequestMapping(value = "goback", method = RequestMethod.GET)
	public String goback(Model model) {
		return "redirect:tripview";
	}

	@RequestMapping(value = "seoulview", method = RequestMethod.GET)
	public String seoulview(Model model, @ModelAttribute PageVO pagevo) {
		return "redirect:tripview?region=서울";
	}

	@RequestMapping(value = "busanview", method = RequestMethod.GET)
	public String busanview(TVVO tvvo, Model model) {
		return "redirect:tripview?region=부산";
	}

	@RequestMapping(value = "yeosuview", method = RequestMethod.GET)
	public String yeosuview(TVVO tvvo, Model model) {
		return "redirect:tripview?region=여수";
	}

	@RequestMapping(value = "jejuview", method = RequestMethod.GET)
	public String jejuview(TVVO tvvo, Model model) {
		return "redirect:tripview?region=제주";
	}

	@RequestMapping(value = "tripviewmod", method = RequestMethod.GET)
	public String tripviewmod(@RequestParam("tvo") String ttvo, Model model) {
		TVVO tvvo = tripservice.selectOne(ttvo);
		List<String> files = tripservice.getFileNames(ttvo);
		model.addAttribute("files", files);
		model.addAttribute("mtvo", tvvo);
		return "modwrform";
		// 리턴값을 해당게시물 번호의 view로 이동하면됨
	}

	@RequestMapping(value = "tripviewdel", method = RequestMethod.GET)
	public String tripviewdel(Model model, @RequestParam("tvo") String tvo) {
		List<String> filenames = tripservice.getFileNames(tvo);
		for(String filename : filenames) {
			filedataUtil.deleteFile(filename);
		}
		tripservice.deleteNum(tvo);
		return "redirect:tripview";
	}

	@RequestMapping(value = "updateviewpro", method = RequestMethod.POST)
	public String updateviewpro(TVVO tvo, MultipartFile[] file) throws Exception {
		String[] fileNames = filedataUtil.fileUpload(file);
		tvo.setFiles(fileNames);
		tripservice.update(tvo);
		return "redirect:tvdetail?tvo=" + tvo.getView_num();
		// 여기부분은 해당 tvo view로 가는 컨트롤러를 하나 더 만들어서 돌려도 좋을 거 같음
	}

	@RequestMapping(value = "deleteFile", method = RequestMethod.GET)
	@ResponseBody
	public String deleteFile(@RequestParam("filename") String filename) {
		// 서버에서 파일 삭제 로직을 수행
		filedataUtil.deleteFile(filename);
		tripservice.deleteFnum(filename);
		return "File deleted successfully";
	}
}
