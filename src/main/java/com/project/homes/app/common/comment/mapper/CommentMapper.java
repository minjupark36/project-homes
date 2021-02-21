package com.project.homes.app.common.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.comment.dto.CommentDto;



@Repository
@Mapper
public interface CommentMapper {
	long insertComment(CommentDto commentDto);
	List<CommentDto> commentList(long id);
	long deleteComment(long id);
	long editComment(CommentDto commentDto);
	long replyComment(CommentDto commentDto);
	void groupOrderUpdate(@Param("id") long id, @Param("groupOrder") long group_order);
	long countComment(@Param("id") long id);
}
