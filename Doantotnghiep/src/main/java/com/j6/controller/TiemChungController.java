package com.j6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TiemChungController {
	@RequestMapping("/lichhentiemchung")
	public String home(Model model) {
		model.addAttribute("home", true);
		return "tiemchung/lichhentiemchung";
	}
	
	
	@RequestMapping("/dangkytiemchung")
	public String home1(Model model) {
		model.addAttribute("home", true);
		return "tiemchung/dangkytiemchung";
	}
	
	@RequestMapping("/nhacnhotiemchung")
	public String home2(Model model) {
		model.addAttribute("home", true);
		return "tiemchung/nhacnhotiemchung";
	}
}
