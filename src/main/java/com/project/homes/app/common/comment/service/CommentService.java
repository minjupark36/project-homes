package com.project.homes.app.common.comment.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.homes.app.common.comment.dto.CommentDto;
import com.project.homes.app.common.comment.mapper.CommentMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CommentService {
private final CommentMapper commentMapper;
	
	//댓글 달기
	public long insertComment(CommentDto commentDto) {
		
		return commentMapper.insertComment(commentDto);
	}
	
	//디테일 페이지에 댓글 리스트 보여주기
	@Transactional
	public List<CommentDto> commentList(@RequestParam("id") long id){
		return commentMapper.commentList(id);
	}
	
	//댓글 삭제하기
	public long deleteComment(long id) {
		
		return commentMapper.deleteComment(id);
	}
	
	//댓글 수정하기
	public long editComment(CommentDto commentDto) {
		
		return commentMapper.editComment(commentDto);
	}
	
	//댓글에 답글 달기
	public long replyComment(CommentDto commentDto
							  ,@RequestParam("id") long id
							  ,@RequestParam("groupOrder") long groupOrder) {
		long res = commentMapper.replyComment(commentDto);
		commentMapper.groupOrderUpdate(id, groupOrder);
		return res;
		
	}
	//댓글 개수
	public long countComment(@RequestParam("id") long id) {
		return commentMapper.countComment(id);
	}
}
