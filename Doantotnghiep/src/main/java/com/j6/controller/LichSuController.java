package com.j6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LichSuController {
	@RequestMapping("/lichsukhaibao")
	public String home(Model model) {
		model.addAttribute("home", true);
		return "lichsu/lichsukhaibao";
	}
	
	@RequestMapping("/lichsutiem")
	public String home1(Model model) {
		model.addAttribute("home", true);
		return "lichsu/lichsutiem";
	}
}
