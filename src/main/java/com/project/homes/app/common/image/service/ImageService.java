package com.project.homes.app.common.image.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.project.homes.app.common.image.dto.ImageDto;
import com.project.homes.app.common.image.mapper.ImageMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service 
public class ImageService {
	
	private final ImageMapper imageMapper;

	public List<ImageDto> getMainImages(String order) {
		return imageMapper.getMainImages(order) ;
	}	
	
	//메인 이미지 insert
	public long insertInteriorImage(ImageDto imageDto) {
		return imageMapper.insertInteriorImage(imageDto);
	}
	
	//가장 최근에 insert한 인테리어 사진 
	public ImageDto getMaxIdInteriorImage() {
		return imageMapper.getMaxIdInteriorImage();
	}

}
