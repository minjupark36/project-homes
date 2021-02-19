package com.project.homes.app.user.board.service;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;

import com.project.homes.app.user.board.dto.BoardDto;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class BoardServiceTest {

	@LocalServerPort
	int port;
	
	@Autowired
	TestRestTemplate restTemplate;
	
	@Autowired
	BoardService boardService;
	
	@Test
	void 게시판_리스트() {
		
		List<BoardDto> list = boardService.getBoardList();
		
		for(BoardDto board : list) {
			System.out.println(board.toString());
		}
		
	}
	
	
	
}
