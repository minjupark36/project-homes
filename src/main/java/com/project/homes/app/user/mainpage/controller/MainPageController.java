package com.project.homes.app.user.mainpage.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.homes.app.common.image.dto.ImageDto;
import com.project.homes.app.common.image.service.ImageService;
import com.project.homes.app.user.mainpage.dto.MainPageDto;
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
	public String mainPageList(Model model) {
		
		model.addAttribute("interior",mainPageService.getInteriorImages());
		model.addAttribute("deco",mainPageService.getDecoImages());
//		model.addAttribute("hashtagList",hashtagService.selectHashtags());
		
		return "/user/mainpage/main";
	}
	
	/*메인-사진 페이지*/
	@GetMapping("/main/images")
	public String mainImagesList(Model model
			,@RequestParam(name="order", defaultValue="recent") String order) {

		model.addAttribute("mainpageList",mainPageService.getImageList(order));
//		model.addAttribute("hashtagList",hashtagService.selectHashtags());

		return "/user/mainpage/mainImages";
	}
	
	/*메인-정보 페이지*/
	@RequestMapping("/main/info")
	public String mainInfoList(Model model
			, @RequestParam(name="order", defaultValue="recent") String order
			, @RequestParam(name="search", defaultValue ="") String searchAs
			) {

		System.out.println("===========================");
		System.out.println(searchAs);
		System.out.println("===========================");
//		MemberDto memberDto = Utils.getMemberFromSession();
		
		model.addAttribute("searchAs",searchAs);
		model.addAttribute("infoList", mainPageService.getInfoList(searchAs));		
		return "/user/mainpage/mainInfo";
	}
	
	/*개인정보처리방침*/
	@GetMapping("/user/terms/privacy")
	public String privacyPolicy() {
		
		return "/user/terms/privacy_policy";
	}

	/*이용약관*/
	@GetMapping("/user/terms/conditions")
	public String termsAndConditions() {
		
		return "/user/terms/terms_and_conditions";
	}
	
	
	//메인페이지에서 인테리어 사진 클릭 -> 디테일 페이지
	@GetMapping("/main/detail")
	public String mainPageDetail(Model model,@RequestParam("id") long id) {
		model.addAttribute("interiorImage",mainPageService.getMainPageDetail(id));
		model.addAttribute("decoImage",mainPageService.getDecoDetail(id));
		model.addAttribute("numberOfDeco",mainPageService.getDecoDetail(id).size());
//		String imageTags = mainInteriorDetail.getHashtagsNames();
//		List<String> tagList = Arrays.asList(imageTags.split("  "));
//		model.addAttribute("tagList",tagList);
		mainPageService.countView(id);
		//model.addAttribute("commentsList",commentsService.commentsList(id));
		return "/user/mainpage/mainDetail";
	}
	
	
	//다음(page=2) 혹은 이전(page=1) 게시판 보여주기
	@PostMapping("/main/detail")
	@ResponseBody
	public String getNextDetail(@RequestParam("id") long id,@RequestParam("page") int page) {
		String info=null;
		if(page==2) {
			ImageDto nextDetail=mainPageService.getNextDetail(id);
			long nextId=nextDetail.getId();
			info=nextId+"";
		}
		else if(page==1) {
			ImageDto preDetail=mainPageService.getPreDetail(id);
			long nextId=preDetail.getId();
			info=nextId+"";
		}
		return info;
	}
	
}
