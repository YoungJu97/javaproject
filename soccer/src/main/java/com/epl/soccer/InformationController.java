package com.epl.soccer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InformationController {
	

		@RequestMapping(value = "information", method = RequestMethod.GET)
		public String home(Model model) {
			

			
			return "clubinformation";
		}
		@RequestMapping(value = "selectclub", method = RequestMethod.GET)
		public String selectclub(Model model,@RequestParam("teamId") String num) {
			

			model.addAttribute("num", num);
			return "selectclub";
		}
		
	}


