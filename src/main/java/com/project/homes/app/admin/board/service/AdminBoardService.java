package com.project.homes.app.admin.board.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.homes.app.admin.board.mapper.AdminBoardMapper;
import com.project.homes.app.common.attach.service.AttachService;
import com.project.homes.app.user.board.dto.BoardDto;
import com.project.homes.app.admin.board.dto.AdminBoardDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminBoardService {
	
	private final AdminBoardMapper adminBoardMapper;
	private final AttachService attachService;
	
	/*게시글 리스트*/
	public List<AdminBoardDto> getBoardList(Map<String, Object> searchMap){
		return adminBoardMapper.getBoardList(searchMap);
	}

	/*게시글 삭제*/
	public boolean deleteBoard(int id) {
		return adminBoardMapper.deleteBoard(id);
		
	}

}
