package com.project.homes.app.common.hashtag.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.hashtag.dto.HashtagDto;


@Repository
@Mapper
public interface HashtagMapper {
	//태그 리스트 보여주기
	List<HashtagDto> selectHashtags();
	
	//선택한 태그 삭제하기
	boolean deleteTag(long id);
	
	//선택한 태그 편집하기
	boolean editTag(HashtagDto hastagDto);
	
	//태그 추가하기
	boolean insertTag(HashtagDto hastagDto);
}
