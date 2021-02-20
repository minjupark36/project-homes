package com.project.homes.app.user.scrap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.homes.app.user.scrap.mapper.ScrapMapper;
import com.project.homes.app.user.scrap.service.ScrapService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor/*@Autowired대신 final필드에 생성자 생성*/
@Controller/*웹 브라우저의 요청 처리, Service호출*/
public class ScrapController {
	
	private final ScrapService scrapService;
	
	@Autowired
	private ScrapMapper scrapMapper;
	
	/*스크랩 페이지*/
	@RequestMapping("/user/scrap")
	public String showScrapList(Model model
			, @RequestParam(value="sort", defaultValue="all") String sort			
			) {
		
		int limit = 4;
//		MemberDto memberDto = Utils.getMemberFromSession();		
		model.addAttribute("scrapList",scrapService.getScrapList(sort,limit));
		return "user/scrap/scrapList";
	}
	
	/*스크랩 추가*/
	@RequestMapping("/scrap/add")
	@ResponseBody
	public boolean addToScrap(@RequestParam("imagesId") long imagesId
			) {
		
//		ScrapDto scrapDto = new ScrapDto();
//		ImagesDto imagesDto = new ImagesDto();
//		
//		MemberDto memberDto = Utils.getMemberFromSession();
		
		System.out.println("================================");
		System.out.println(imagesId);
		System.out.println("================================");
		
		boolean res = scrapService.addToScrap(imagesId);
		scrapService.countScrap(imagesId);
		
		return res;		
	}
	
	/*스크랩 취소*/
	@DeleteMapping("/user/scrap")
	@ResponseBody
	public String deleteScrap(@RequestParam("id") long id) {
//		MemberDto memberDto = Utils.getMemberFromSession();
		return scrapService.deleteScrap(id)+"";
	}
	
}
