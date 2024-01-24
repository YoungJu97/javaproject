package com.res.travel;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.res.service.IF_ReservationService;
import com.res.vo.ReservationVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	IF_ReservationService resservationservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model) {
		List<ReservationVO> rlist=resservationservice.selectRank();
	
		
		model.addAttribute("rank",rlist);
		return "home";
	}
	
}
