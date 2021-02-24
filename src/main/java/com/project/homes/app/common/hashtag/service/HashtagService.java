package com.project.homes.app.common.hashtag.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.homes.app.common.hashtag.dto.HashtagDto;
import com.project.homes.app.common.hashtag.mapper.HashtagMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class HashtagService {
	
	private final HashtagMapper hashtagMapper;
	//태그 리스트
	public List<HashtagDto> selectHashtags() {
		return hashtagMapper.selectHashtags();
	}
	
	//선택한 태그 삭제
	public String deleteTag(@RequestParam("id") long id) {
		boolean res = hashtagMapper.deleteTag(id);
		return res+"";
	}
	
	//선택한 태그 수정
	public String editTag(HashtagDto hashtagDto) {
		return hashtagMapper.editTag(hashtagDto)+"";
	}
	
	//태그 추가
	public String insertTag(HashtagDto hashtagDto) {
		return hashtagMapper.insertTag(hashtagDto)+"";
	}
	
}
