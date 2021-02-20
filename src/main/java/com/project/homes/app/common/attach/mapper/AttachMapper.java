package com.project.homes.app.common.attach.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.attach.dto.AttachDto;

@Repository
@Mapper
public interface AttachMapper {
	
	void insertAttach(HashMap<String,Object> map);
	long deleteAttach(long id);
	List<AttachDto> getAttachById(long id);
	
}
