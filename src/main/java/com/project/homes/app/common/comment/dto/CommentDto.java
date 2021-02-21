package com.project.homes.app.common.comment.dto;

import java.time.LocalDate;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class CommentDto {
	private Long id;
	private Long memberId;
	private Long imageId;
	private String content;
	private LocalDate createDate;
	private LocalDate modifiedDate;
	private Long groupNo;
	private Long groupOrder;
	private Long depth;
}
