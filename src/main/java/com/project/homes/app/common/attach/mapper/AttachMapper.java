package com.project.homes.app.common.attach.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AttachMapper {
	
	void insertAttach(HashMap<String,Object> map);
	long deleteAttach(long id);

	
}
