package com.j6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class KhaiBaoYteController {
	@RequestMapping("/khaibaoyte")
	public String home(Model model) {
		model.addAttribute("home", true);
		return "khaibaoyte/khaibaoyte";
	}
}
