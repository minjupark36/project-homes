package com.project.homes.app.user.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.user.board.dto.BoardDto;

@Repository
@Mapper
public interface BoardMapper {

	List<BoardDto> getBoardList();

}
