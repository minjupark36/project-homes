package com.project.homes.app.user.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.project.homes.app.user.board.dto.BoardDto;
import com.project.homes.app.user.board.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService boardService;
	
	@GetMapping("/user/board")
	public String boardList(Model model) {
		model.addAttribute("boardList",boardService.getBoardList());
		return "user/board/boardList";
	}

}
