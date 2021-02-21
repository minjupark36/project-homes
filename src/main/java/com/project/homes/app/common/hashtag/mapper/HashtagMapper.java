package com.project.homes.app.common.hashtag.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.hashtag.dto.HashtagDto;


@Repository
@Mapper
public interface HashtagMapper {
	List<HashtagDto> selectHashtags();
}
