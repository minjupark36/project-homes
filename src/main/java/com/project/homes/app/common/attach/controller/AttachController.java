package com.project.homes.app.common.attach.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.homes.app.common.attach.service.AttachService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AttachController {
	
	private final AttachService attachService;
	
	@ResponseBody
	@DeleteMapping("/user/board/attach")
	public long deleteAttach(@RequestParam("id") long id) {
		return attachService.deleteAttach(id);
	}
	

}
