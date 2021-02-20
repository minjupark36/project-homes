package com.project.homes.app.user.mainpage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.image.dto.ImageDto;

@Repository
@Mapper
public interface MainPageMapper {
	
	/*메인페이지사진(인테리어,소품)*/
	List<ImageDto> getInteriorImages();
	List<ImageDto> getDecoImages();

}
