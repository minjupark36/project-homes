package com.project.homes.app.user.scrap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.member.dto.MemberDto;
import com.project.homes.app.user.scrap.dto.ScrapDto;

@Repository
@Mapper
public interface ScrapMapper {
	
	List<ScrapDto> getScrapList(String sort, int limit);

}
