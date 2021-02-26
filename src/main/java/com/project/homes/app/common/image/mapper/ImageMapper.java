package com.project.homes.app.common.image.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.image.dto.ImageDto;

@Repository
@Mapper
public interface ImageMapper {
	
	List<ImageDto> getMainImages(String order);
	long insertInteriorImage(ImageDto imageDto);
	ImageDto getMaxIdInteriorImage();
	long insertDecoImage(ImageDto imageDto);
	long deleteInteriorImage(long id);
}
