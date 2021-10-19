package com.j6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DoiMatKhauController {
	@RequestMapping("/taikhoan/doimatkhau")
	public String home(Model model) {
		model.addAttribute("home", true);
		return "security/doimatkhau";
	}
}
