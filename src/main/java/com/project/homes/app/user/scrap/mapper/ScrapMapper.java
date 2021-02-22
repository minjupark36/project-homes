package com.project.homes.app.user.scrap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.member.dto.MemberDto;
import com.project.homes.app.user.scrap.dto.ScrapDto;

@Repository
@Mapper
public interface ScrapMapper {
	
	/*스크랩 리스트*/
	List<ScrapDto> getScrapList(String sort, int limit, MemberDto memberDto);
	
	/*스크랩 추가 및 삭제*/
	boolean addToScrap(long imagesId, MemberDto memberDto);
	boolean deleteScrap(long id);
	
	/*이미지 조회수/스크랩수*/
	int countView(long id);
	int countScrap(long id);

}
