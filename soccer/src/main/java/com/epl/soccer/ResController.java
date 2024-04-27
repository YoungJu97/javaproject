package com.epl.soccer;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.epl.service.IF_communityService;
import com.epl.service.IF_loginService;
import com.epl.vo.CommentVO;
import com.epl.vo.EpluserVO;

@RestController
public class ResController {
	
	@Inject
	private IF_loginService loginservice;
	
	@Inject
	private IF_communityService communityservice;
	
	@RequestMapping(value = "idchk" , method = RequestMethod.GET)
	public int idchk(@RequestParam("user_id") String idchk) {
		
		List<EpluserVO> epluser=loginservice.select();
		
		for(EpluserVO user : epluser) {
			
			if(user.getUser_id().equals(idchk)) {
				
				return 1; 
			}
		}
		return 0; 
	}
	@RequestMapping(value = "loginchk", method = RequestMethod.POST)
	public int clear(@RequestBody EpluserVO uservo) {		
		List<EpluserVO> login=loginservice.select();
		boolean idtrue=false;
		boolean passtrue=false;
		for(EpluserVO user : login) {	
			if(user.getUser_id().equals(uservo.getUser_id())) {
				idtrue=true;
				if(user.getUser_pass().equals(uservo.getUser_pass())) {
					passtrue=true;
					break;
				}	 
			}
			
		}
		if(idtrue) {
			if(passtrue) {
				return 0;
			}else {
				
				return 2;
			}
		}else {
			return 1;
		}
	}
	@RequestMapping(value = "communitycomment" , method = RequestMethod.GET)
	public int communitycomment(CommentVO comvo) {
		if(comvo.getCom_text()!=null) {
		communityservice.communitycomment(comvo);
		return 0; 
		}else {
			return 1;
		}
		
	}
	
	
} 
		
		