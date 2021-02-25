package com.project.homes.app.user.mainpage.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.homes.app.common.image.dto.ImageDto;
import com.project.homes.app.common.info.dto.InfoDto;
import com.project.homes.app.common.member.dto.MemberDto;
import com.project.homes.app.user.mainpage.mapper.MainPageMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service 
public class MainPageService {
	
	private final MainPageMapper mainPageMapper;

	public List<ImageDto> getInteriorImages() {
		return mainPageMapper.getInteriorImages() ;
	}
	
	public MemberDto getMemberInto(int userId) {
		return mainPageMapper.getMemberInto(userId);
	}
	
	public List<ImageDto> getDecoImages() {
		return mainPageMapper.getDecoImages() ;
	}

	public List<ImageDto>  getImageList(String order) {
		return mainPageMapper.getImageList(order);
	}
	
	public List<ImageDto> getRecommendedInteriorImages(List<Integer> newList) {
		return mainPageMapper.getRecommendedInteriorImages(newList);
	}

	public List<ImageDto> getRecommendedDecoImages(List<Integer> newList) {
		return mainPageMapper.getRecommendedDecoImages(newList);
	}
	
	public List<InfoDto> getInfoList(String searchAs) {
		return mainPageMapper.getInfoList(searchAs);
	}
	
	public ImageDto getMainPageDetail(@RequestParam("id") long id) {		
		return mainPageMapper.getInteriorDetail(id);
	}
	
	public List<ImageDto> getDecoDetail(@RequestParam("id") long id) {
		return mainPageMapper.getDecoDetail(id);
	}


	public long countView(@RequestParam("id") long id) {
		return mainPageMapper.countView(id);
	}
	
	public ImageDto getNextDetail(@RequestParam("id") long id) {		
		return mainPageMapper.getNextDetail(id);
	}

	public ImageDto getPreDetail(@RequestParam("id") long id) {		
		return mainPageMapper.getPreDetail(id);
	}

	public List<ImageDto> getTagImageList(@RequestParam("hashtagsNames") String hashtagsNames) {		
		return mainPageMapper.getTagImageList(hashtagsNames);
	}


}
