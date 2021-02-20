package com.project.homes.app.user.mainpage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.homes.app.common.image.service.ImageService;
import com.project.homes.app.user.mainpage.mapper.MainPageMapper;
import com.project.homes.app.user.mainpage.service.MainPageService;
import com.project.homes.app.user.scrap.service.ScrapService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MainPageController {
	
	private final MainPageService mainPageService;
	private final ImageService imageService;
	private final ScrapService scrapService;
	
	@Autowired
	private MainPageMapper mainPageMapper;
	
	/*메인 페이지*/
	@GetMapping("/main")
	public String mainPageList(Model model
			,@RequestParam(name="order", defaultValue="recent") String order) {
		
		model.addAttribute("interior",mainPageService.getInteriorImages());
		model.addAttribute("deco",mainPageService.getDecoImages());
		
		return "/user/mainpage/main";
	}
}
