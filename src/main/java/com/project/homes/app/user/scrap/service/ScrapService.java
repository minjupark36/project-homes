package com.project.homes.app.user.scrap.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.homes.app.user.scrap.dto.ScrapDto;
import com.project.homes.app.user.scrap.mapper.ScrapMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service 
public class ScrapService {
	
	private final ScrapMapper scrapMapper;

	public List<ScrapDto> getScrapList(String sort, int limit) {		
		return scrapMapper.getScrapList(sort,limit);
	}

}
