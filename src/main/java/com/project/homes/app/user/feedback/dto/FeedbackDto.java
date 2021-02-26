package com.project.homes.app.user.feedback.dto;

import java.time.LocalDate;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@Getter
@Setter
public class FeedbackDto {
	private int id;
	private String writer;
	private LocalDate createDate;
	private String content;
	
	@Builder
	public FeedbackDto(int id, String writer, LocalDate createDate, String content) {
		super();
		this.id = id;
		this.writer = writer;
		this.createDate = createDate;
		this.content = content;
	}
	
	
}
