package com.res.travel;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.res.service.IF_MemberService;
import com.res.vo.MemberVO;

@Controller
public class MemberController {
	@Inject
	private IF_MemberService memberservice;
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String accdation(){

		return "join";
	}
	@RequestMapping(value = "memberjoin", method = RequestMethod.POST)
	public String member(MemberVO membervo){
		memberservice.insert(membervo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "logout" , method = RequestMethod.GET)
	public String logout(HttpSession session,HttpServletResponse response) {
		Cookie cookie=new Cookie("user_id","");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		session.invalidate();
	
		return "redirect:/";
		
	} 
	@RequestMapping(value = "login" , method = RequestMethod.POST)
	public String login(Model model,MemberVO membervo,HttpServletResponse response,HttpSession session) {
		MemberVO mvo=memberservice.select(membervo.getUser_id());
		if (mvo != null) {
		    if (session.getAttribute("user_id") != null) {
		        session.removeAttribute("user_id");
		    }
		    if (mvo.getUser_pass().equals(membervo.getUser_pass())) {
		        Cookie cookie = new Cookie("user_id", mvo.getUser_id());
		        cookie.setMaxAge(1000);
		        cookie.setPath("/");
		        response.addCookie(cookie);
		        session.setAttribute("user_id", mvo.getUser_id());
		    } else {
		        model.addAttribute("loginError", "Invalid password");
		        return "/include/top";
		    }
		} else {
		    model.addAttribute("loginError", "User not found");
		    return "/include/top";
		}
		return "redirect:/";
	} 
	@RequestMapping(value = "myinfo", method = RequestMethod.GET)
	public String myinfo(Model model,MemberVO membervo){
		
		MemberVO mvo=memberservice.select(membervo.getUser_id());
		model.addAttribute("myinfo",mvo);
		return "myinfo";
	}
	@RequestMapping(value = "memberinfo", method = RequestMethod.POST)
	public String memberinfo(MemberVO membervo){
		memberservice.update(membervo);
		
		return "redirect:/";
	}
}
