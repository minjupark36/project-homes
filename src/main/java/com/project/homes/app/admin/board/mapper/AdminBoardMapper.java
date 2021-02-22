package com.project.homes.app.admin.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.homes.app.admin.board.dto.AdminBoardDto;

@Repository
@Mapper
public interface AdminBoardMapper {

	List<AdminBoardDto> getBoardList(@Param("searchMap") Map<String, Object> searchMap);

}
