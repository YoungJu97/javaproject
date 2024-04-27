package com.epl.soccer;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.epl.service.IF_loginService;
import com.epl.vo.EpluserVO;


@Controller
public class HomeController {
	
	@Inject
	private IF_loginService loginservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		

		
		return "index";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		

		return "login";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Model model,EpluserVO uservo) {
		loginservice.join(uservo);

		return "redirect:login";
	}
	@RequestMapping(value = "clear", method = RequestMethod.POST)
	public String clear(Model model,EpluserVO uservo,HttpServletResponse response,HttpSession session) {
		Cookie cookie=new Cookie("user_id",uservo.getUser_id());
		cookie.setMaxAge(1000);
		cookie.setPath("/");
		response.addCookie(cookie);
			
		if(session.getAttribute("user_id")!=null) {
		   session.removeAttribute("user_id");
		}
			
		session.setAttribute("user_id",uservo.getUser_id());

		return "redirect:/";
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletResponse response,HttpSession session) {
		Cookie cookie=new Cookie("user_id","");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		session.invalidate();
	
		return "redirect:/";
	}
	@RequestMapping(value = "myinfo", method = RequestMethod.GET)
	public String myinfo(Model model,EpluserVO eplvo) {
		
		model.addAttribute("myinfo", loginservice.selectid(eplvo));
		return "myinfo";
	}
	@RequestMapping(value = "passchang", method = RequestMethod.POST)
	public String passchang(Model model,EpluserVO eplvo) {
		loginservice.passchange(eplvo);
		
		return "redirect:myinfo?user_id="+eplvo.getUser_id();
	}
}
