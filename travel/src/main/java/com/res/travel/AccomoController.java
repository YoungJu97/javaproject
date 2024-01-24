package com.res.travel;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.res.service.IF_accService;
import com.res.util.FileDataUtil;
import com.res.vo.ReservAnswerVO;
import com.res.vo.ReservVO;
import com.res.vo.RpageVO;

@Controller
public class AccomoController {
	@Inject
	IF_accService accservice;
	@Inject
	FileDataUtil filedataUtill;
	
	// writepage
	@RequestMapping(value = "accwr", method = RequestMethod.GET)
	public String accwr(Model model) {
		return "accwr";
	}
	// @ModelAttribute 뷰의(요청파라미터와)받는 객체를 바인딩하기 위해 사용 . 업로드 후에 바인딩필요한 객체인지 다시한번
	// 생각해보기.
	
	@RequestMapping(value = "destination", method = RequestMethod.GET)
	public String destination(Model model ) {
		return "destination1";
	}
	@RequestMapping(value = "destinDetail", method = RequestMethod.GET)
	public String destinDetail(Model model,@RequestParam("contentId") String contentId) {
		model.addAttribute("contentId",contentId);
		return "destinDetail";
	}
	
	// insert one
	@RequestMapping(value = "abwr", method = RequestMethod.POST)
	public String abwr(Model model, ReservVO rvo, MultipartFile[] file) throws Exception {
//		System.out.println(rvo.getAccTitle());
		for (int i = 0; i < file.length; i++) {
			System.out.println(i + "번 파일 이름 : " + file[i].getOriginalFilename());
		} 
		String[] fileNames = filedataUtill.fileUpload(file);
		rvo.setFiles(fileNames);
		accservice.insertOne(rvo);
		System.out.println(fileNames[0]);
		rvo.prt();
		return "redirect:/acb";
	}
	
	// viewlist
	@RequestMapping(value = "acb", method = RequestMethod.GET)
	public String join(Model model, @ModelAttribute RpageVO rpagevo) {

		if (rpagevo.getPage() == null || rpagevo.getPage() == 0) {
			rpagevo.setPage(1);
		}
		rpagevo.setTotalCount(accservice.getTotalcnt());
		List<ReservVO> acclist = accservice.selectAll(rpagevo);
		List<ReservVO> filedAccList = new ArrayList<>();
		if (!acclist.isEmpty()) {
			for (int i = 0; i < acclist.size(); i++) {
				filedAccList.add(i, acclist.get(i));
				int passNum = filedAccList.get(i).getAccNum();
				if(accservice.getFileNames(passNum)!=null) {
				
				List<String> fns = accservice.getFileNames(passNum);
				String[] filenames = fns.toArray(new String[0]);
//				System.out.println(fns.get(0));
//				String passFile = fns.get(0);
				filedAccList.get(i).setFiles(filenames);	
				}
//				System.out.println(filedAccList.get(i).getAccNum());
//				System.out.println(filedAccList.get(i).getFiles()[0]);
			}
		}
		model.addAttribute("acclist", filedAccList);
		model.addAttribute("rpagevo", rpagevo);
//		List<String> files = accservice.getFileNames(vno);
//		model.addAttribute("files", files);
		return "accboard"; // 논리적인 view이름. 뷰리졸브 pre suf 실제 뷰를 만든다.
	}

//	 accboard 자세히 보기
		@RequestMapping(value = "detail" , method = RequestMethod.GET)
		public String viewDetail(Model model, @RequestParam("acvno") int acvno) {
			//첨부파일 가져오기
			// 쿼리 " select * from accFiles where accNum=${acvno}  리턴타입 List(기본2개)
			//insert 로 넣어준 객체 하나 그대로 가져오면 편한데 .....  일단 테이블이 파일과는 달라서 2번나눠서 진행하거나 파일포함된 객체에 담아야됨.
//			ReservVO detailvo = null; // 우선 객체하나 생성해서 셀렉트 문으로 acvno 에 해당하는 넘버의 테이블 튜플하나 가져와서 값 넣어줘야됨.
			ReservVO detailvo = accservice.selectOne(acvno);
			int passNum=acvno;
			if(accservice.getFileNames(passNum)!=null) { // 리스트 뷰 에서 만들어둔 매서드 활용
				List<String> getfiles = accservice.getFileNames(passNum); 
//				System.out.println(getfiles.get(0));
//				System.out.println(getfiles.get(1));
//				detailvo.setFiles(i,getfiles.get(i));
				String[] convertedGetfiles = getfiles.toArray(new String[0]);
				detailvo.setFiles(convertedGetfiles);
//				System.out.println(detailvo.getFiles()[0]);
//				System.out.println(detailvo.getFiles()[1]);
			}
			if(accservice.selectAnswer(acvno)!=null) {
				List<ReservAnswerVO> ravolist = accservice.selectAnswer(acvno);
				model.addAttribute("answerlist", ravolist);				
			}
//			System.out.println(ravolist.get(0).getAnswerWriter());
			model.addAttribute("fvo", detailvo);
			return "accdetail";   
		} 
		@RequestMapping(value = "accDel" , method = RequestMethod.GET)
		public String delete(Model model, @RequestParam("dno") int dno) {
			accservice.deleteOne(dno);
			accservice.deleteFile(dno);
			return "redirect:/acb"; 
		} 
		@RequestMapping(value = "accMod" , method = RequestMethod.GET)
		public String update(Model model, @RequestParam("mno") int mno) {
			System.out.println(mno);
			int acvno = mno;
			ReservVO updatevo = accservice.selectOne(acvno);
			System.out.println(updatevo.getAccWriter());
			int passNum=acvno;
			if(accservice.getFileNames(passNum)!=null) { 
				List<String> getfiles = accservice.getFileNames(passNum);
				String[] convertedGetfiles = getfiles.toArray(new String[0]);
				updatevo.setFiles(convertedGetfiles);
			}
			if(accservice.selectAnswer(acvno)!=null) {
				List<ReservAnswerVO> ravolist = accservice.selectAnswer(acvno);
				model.addAttribute("answerlist", ravolist);
			}
			model.addAttribute("uvo", updatevo);
			
			
			return "accmodform"; 
		} 
		@RequestMapping(value = "modconfirm" , method = RequestMethod.POST)
		public String accupdate(Model model, @ModelAttribute ReservVO rvo,@RequestParam(name="Dfiles",required = false) String[] Dfiles,MultipartFile[] file)throws Exception {
			if(Dfiles!=null) {
//				System.out.println(Dfiles.length);
//				System.out.println(Dfiles[0]);
				for(int i=0; i<Dfiles.length; i++) {
					accservice.deleteFile(Dfiles[i]);
				}
			}
//			System.out.println(rvo.getAccContents());
//			System.out.println(rvo.getAccTitle());
//			System.out.println(rvo.getAccNum());
			String[] fileNames = filedataUtill.fileUpload(file);
			rvo.setFiles(fileNames);
			System.out.println(rvo.getAccNum());
			System.out.println(rvo.getFiles()[0]);
			accservice.updateOne(rvo);
			return "redirect:/detail?acvno="+rvo.getAccNum();
		}
}
