package com.project.homes.app.common.image.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.homes.app.common.image.dto.ImageDto;
import com.project.homes.app.common.image.mapper.ImageMapper;
import com.project.homes.app.common.image.service.ImageService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ImageController {
	
	private final ImageService imageService;

	@Autowired
	private ImageMapper imageMapper;
	
	//관리자 페이지에서 이미지 insert form으로 이동
	@GetMapping("/admin/image")
	public String getInsertForm() {
		return "admin/mainImage/insertImageForm";
	}
	
	//image insert
	@PostMapping("/admin/image/insert")
	public String insertImage(ImageDto imageDto) {
		return imageService.insertImage(imageDto)+"";
	
	}
}
