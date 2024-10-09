package com.project.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.cloth.bo.ClothBO;

@Controller
public class MainController {
	
	@Autowired
	private ClothBO clothBO;
	
	@GetMapping("/main-view")
	public String mainPage(Model model) {
		model.addAttribute("viewName", "main/main");
		
		// List<ClothDetail> clothList = clothBO.getClothDetail();
		
		// model.addAttribute("clothList", clothList);
		
		return "template/mainLayout";
	}
}
