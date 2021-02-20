package com.project.homes.app.user.mainpage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.homes.app.common.image.dto.ImageDto;
import com.project.homes.app.common.info.dto.InfoDto;
import com.project.homes.app.user.mainpage.mapper.MainPageMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service 
public class MainPageService {
	
	private final MainPageMapper mainPageMapper;

	public List<ImageDto> getInteriorImages() {
		return mainPageMapper.getInteriorImages() ;
	}
	
	public List<ImageDto> getDecoImages() {
		return mainPageMapper.getDecoImages() ;
	}

	public List<ImageDto>  getImageList(String order) {
		return mainPageMapper.getImageList(order);
	}
	
	public List<InfoDto> getInfoList(String searchAs) {
		return mainPageMapper.getInfoList(searchAs);
	}
	

}
