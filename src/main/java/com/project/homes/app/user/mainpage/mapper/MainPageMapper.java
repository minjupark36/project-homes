package com.project.homes.app.user.mainpage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import com.project.homes.app.common.image.dto.ImageDto;
import com.project.homes.app.common.info.dto.InfoDto;
import com.project.homes.app.user.mainpage.dto.MainPageDto;

@Repository
@Mapper
public interface MainPageMapper {
	
	/*메인페이지사진(인테리어,소품)*/
	List<ImageDto> getInteriorImages();
	List<ImageDto> getDecoImages();
	List<ImageDto> getImageList(String order);
	List<InfoDto> getInfoList(String searchAs);
	
	/*디테일 페이지*/
	ImageDto getInteriorDetail(long id);	
	List<ImageDto> getDecoDetail(long id);
	
	/*해쉬태그 이미지 페이지*/
	List<ImageDto> getTagImageList(String hashtagsNames);
	
	/*이미지 조회수/스크랩수*/
	long countView(long id);
	long countScrap(long id);
	
	/*다음글 이전글*/
	ImageDto getNextDetail(long id);
	ImageDto getPreDetail(long id);

}
