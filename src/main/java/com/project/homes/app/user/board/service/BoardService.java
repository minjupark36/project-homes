package com.project.homes.app.user.board.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import com.project.homes.app.user.board.dto.BoardDto;
import com.project.homes.app.user.board.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardService {
	
	private final BoardMapper boardMapper;
	//게시판 전체 리스트 보여주기
	public List<BoardDto> getBoardList(){
		return boardMapper.getBoardList();
	}
	
	
}
