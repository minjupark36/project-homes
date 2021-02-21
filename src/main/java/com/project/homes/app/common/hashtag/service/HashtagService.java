package com.project.homes.app.common.hashtag.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.project.homes.app.common.hashtag.dto.HashtagDto;
import com.project.homes.app.common.hashtag.mapper.HashtagMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class HashtagService {
	
	private final HashtagMapper hashtagMapper;
	//메인 태그에 들어갈 태그 리스트
	public List<HashtagDto> selectHashtags() {
		return hashtagMapper.selectHashtags();
	}
}
