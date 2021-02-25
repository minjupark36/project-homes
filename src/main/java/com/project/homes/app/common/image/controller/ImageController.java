package com.project.homes.app.common.image.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String getInsertForm(Model model) {
		model.addAttribute("interiorImage",imageService.getMaxIdInteriorImage());
		return "admin/mainImage/insertImageForm";
	}
	
	//interior image insert
	@PostMapping("/admin/image/insert")
	public String insertInteriorImage(ImageDto imageDto) {
		imageService.insertInteriorImage(imageDto);
		return "redirect:/admin/image";
	
	}
	
	//deco image insert
	@PostMapping("/admin/image/insertDeco")
	public String insertDecoImage(ImageDto imageDto) {
		imageService.insertDecoImage(imageDto);
		return "redirect:/admin/image";
	}
	
	
}
