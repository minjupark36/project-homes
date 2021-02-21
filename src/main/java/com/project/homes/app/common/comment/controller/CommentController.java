package com.project.homes.app.common.comment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.homes.app.common.comment.dto.CommentDto;
import com.project.homes.app.common.comment.service.CommentService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CommentController {
	private final CommentService commentService;
	//댓글 달기
	@PostMapping("/comment/insert")
	public String insertComments(CommentDto commentDto) {
		commentService.insertComment(commentDto);
		long id = commentDto.getImageId();
		return "redirect:/main/detail?id="+id;
	}
	
	//댓글 삭제
	@ResponseBody
	@DeleteMapping("/comment/delete")
	public String deleteComment(@RequestParam("id") long id) {
		commentService.deleteComment(id);
	return id+"";
	}
	
	//댓글 편집
	@ResponseBody
	@PostMapping("/comment/edit")
	public String editComment(CommentDto commentDto) {
		System.out.println(commentDto.getContent());
		System.out.println(commentDto.getId());
		commentService.editComment(commentDto);
		return"";
	}
	
	//댓글에 답글달기
	@PostMapping("/comment/reply")
	public String replyComments(CommentDto commentDto
								,@RequestParam("groupNo") long groupNo
								,@RequestParam("groupOrder") long groupOrder) {
		commentService.replyComment(commentDto,groupNo,groupOrder);
		long imageId = commentDto.getImageId();
		return "redirect:/main/detail?id="+imageId;
	}
}
