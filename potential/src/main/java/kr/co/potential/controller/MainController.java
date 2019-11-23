package kr.co.potential.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String Main() {
		return "Main_Page/main";
	}
	
	@RequestMapping("/main2")
	public String Main2() {
		return "Main_Page/main2";
	}
}
