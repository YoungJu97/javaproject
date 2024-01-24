package com.res.travel;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.res.service.IF_accService;
import com.res.vo.ReservAnswerVO;

@RestController 
public class AnswerController {
	@Inject
	IF_accService accservice;
	@RequestMapping(value = "addAnswer" , method = RequestMethod.POST)
	public String addAnswer(ReservAnswerVO ravo) {
//		System.out.println(ravo.getAnswerContents());
//		System.out.println(ravo.getAccNum());
//		System.out.println(ravo.getAnswerWriter());
		accservice.insertAnswer(ravo);
		return "redirect:/acb";
	} 
}
