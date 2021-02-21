package com.project.homes.app.user.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.homes.app.user.board.dto.BoardDto;

@Repository
@Mapper
public interface BoardMapper {

	List<BoardDto> getBoardList(@Param("searchMap") Map<String, Object> searchMap);
	BoardDto getBoardDetail(long id);
	List<BoardDto> getReplyList(long id);
	int insertBoard(BoardDto boardDto);
	long selectMaxId();
	boolean deleteBoard(long id);
	List<BoardDto> boardByCategory(@Param("searchMap") Map<String, Object> searchMap,long categoriesId);
	int editBoard(BoardDto boardDto);
	long countView(long id);
	BoardDto getNextBoard(long id);
	BoardDto getPreBoard(long id);
	long insertReply(BoardDto boardDto);
	void groupOrderUpdate(long id, long groupOrder);
}
