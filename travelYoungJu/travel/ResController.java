package com.res.travel;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.res.service.IF_ReservationService;
import com.res.vo.ReservationVO;

@Controller
public class ResController {
	@Inject
	IF_ReservationService resservationservice;
	
	@RequestMapping(value = "accdation", method = RequestMethod.GET)
	public String accdation( ){

		return "accdation";
	}
	
	@RequestMapping(value = "reservation", method = RequestMethod.GET)
	public String reservation(Model model,ReservationVO rvo){
			model.addAttribute("reservation",rvo);
			
		return "acc_res";
	}
	@RequestMapping(value = "reservation_clear", method = RequestMethod.GET)
	public String clear(@ModelAttribute ReservationVO rvo){
		
		resservationservice.insertRes(rvo);
		
		return "redirect:/";
	}
	@RequestMapping(value = "reschk", method = RequestMethod.GET)
	public String reschk(Model model,@ModelAttribute ReservationVO rvo){
		
		List<ReservationVO> rlist=resservationservice.selectChk(rvo);

		model.addAttribute("resvo",rlist);
		
		return "reschk";
	}
	@RequestMapping(value = "region", method = RequestMethod.GET)
	public String region(Model model,@RequestParam("region") String region){
		
		model.addAttribute("region",region);

		
		return "region";
	}

}
