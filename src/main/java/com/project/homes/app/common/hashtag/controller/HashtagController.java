package com.project.homes.app.common.hashtag.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.homes.app.common.hashtag.service.HashtagService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HashtagController {
	
	private final HashtagService hashtagService;
	
	@GetMapping("/admin/hashtag")
	public String manageHashtag(Model model) {
		model.addAttribute("tagList",hashtagService.selectHashtags());
		return "admin/hashtag/hashtagList";
	}

}
