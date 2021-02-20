package com.project.homes.app.user.board.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.homes.app.user.board.dto.BoardDto;
import com.project.homes.app.user.board.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardService {
	
	private final BoardMapper boardMapper;
	
	//게시판 전체 리스트 보여주기
	public List<BoardDto> getBoardList(Map<String, Object> searchMap){
		return boardMapper.getBoardList(searchMap);
	}
	
	//게시판 카테고리별 리스트 보여주기
		public List<BoardDto> boardByCategory(Map<String, Object> searchMap,@RequestParam("categoriesId") long categoriesId){
			return boardMapper.boardByCategory(searchMap,categoriesId);
		}

	//게시판 디테일 페이지
	public BoardDto getBoardDetail(@RequestParam("id") long id) {
			
		return boardMapper.getBoardDetail(id);
	}

	//디테일 페이지에서 답글 리스트 보여주기
	public List<BoardDto> getReplyList(@RequestParam("id") long id){
		return boardMapper.getReplyList(id);
	}
	
	//디테일 페이지에서 해당 글 삭제하기
	public boolean deleteBoard(@RequestParam("id") long id) {
		return boardMapper.deleteBoard(id);
	}

	//게시판 편집
	@Transactional
	public boolean editBoard(BoardDto boardDto, List<MultipartFile> files) {
		int id = 0;
		try {
			id = boardMapper.editBoard(boardDto);
//				attachService.editAttach(files, id);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public long countView(long id) {
		
		return boardMapper.countView(id);
	}
	
}
