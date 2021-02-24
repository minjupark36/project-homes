package com.project.homes.app.common.image.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.homes.app.common.image.mapper.ImageMapper;
import com.project.homes.app.common.image.service.ImageService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ImageController {
	
	private final ImageService imageService;

	@Autowired
	private ImageMapper imageMapper;
	
	@GetMapping("/admin/image")
	public String getInsertForm() {
		return "admin/mainImage/insertImageForm";
	}
	
}
