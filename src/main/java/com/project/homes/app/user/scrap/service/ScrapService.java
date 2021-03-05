package com.project.homes.app.user.scrap.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.homes.app.common.member.dto.MemberDto;
import com.project.homes.app.user.scrap.dto.ScrapDto;
import com.project.homes.app.user.scrap.mapper.ScrapMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service 
public class ScrapService {
	
	private final ScrapMapper scrapMapper;

	public List<ScrapDto> getScrapList(String sort, int limit, MemberDto memberDto) {		
		return scrapMapper.getScrapList(sort,limit,memberDto);
	}
	
	public boolean addToScrap(long imagesId, MemberDto memberDto) {
		return scrapMapper.addToScrap(imagesId, memberDto);		
	}
	
	public boolean deleteScrap(long id) {
		return scrapMapper.deleteScrap(id);
	}
	
	public long countView(@RequestParam("id") long id) {
		return scrapMapper.countView(id);
	}
	
	public long countScrap(@RequestParam("id") long id) {
		return scrapMapper.countScrap(id);
	}

	public int getScrapCount(Long id) {
		return scrapMapper.getScrapCount(id);
	}

}
