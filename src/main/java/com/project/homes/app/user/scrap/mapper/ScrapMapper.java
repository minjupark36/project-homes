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
	List<ScrapDto> getScrapList(String sort, int limit);
	
	/*스크랩 추가 및 삭제*/
	boolean addToScrap(int imagesId);
	boolean deleteScrap(int id);

}
