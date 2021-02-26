package com.project.homes.app.common.hashtag.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.homes.app.common.hashtag.dto.HashtagDto;
import com.project.homes.app.common.hashtag.service.HashtagService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HashtagController {
	
	private final HashtagService hashtagService;
	//태그 리스트
	@GetMapping("/admin/hashtag")
	public String getTagList(Model model) {
		model.addAttribute("tagList",hashtagService.selectHashtags());
		return "admin/hashtag/hashtagList";
	}
	
	//태그 삭제
	@ResponseBody
	@DeleteMapping("/admin/hashtag/delete")
	public String deleteTag(@RequestParam("id") long id) {
		return hashtagService.deleteTag(id);
	}
	
	//태그 수정
	@ResponseBody
	@PostMapping("/admin/hashtag/edit")
	public String editTag(HashtagDto hashtagDto) {
		return hashtagService.editTag(hashtagDto);
	}
	
	//태그 추가
	@ResponseBody
	@PostMapping("/admin/hashtag/insert")
	public String insertTag(HashtagDto hashtagDto) {
		return hashtagService.insertTag(hashtagDto);
	}
	
	@ResponseBody
	@PostMapping("/hashtag/click")
	public long countTag(@RequestParam("id") long id) {
		return hashtagService.countTag(id);
	}

}
