package com.project.homes.app.user.board.dto;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

public class BoardDtoTest {

	@Test
	public void 롬복_테스트() {
		
		BoardDto boardDto = new BoardDto();
		boardDto.setContent("테스트");
		
		assertThat(boardDto.getContent()).isEqualTo("테스트");
	}
	
	
}
