package com.project.homes.app.admin.board.dto;


import java.time.LocalDate;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Setter
@Getter
public class AdminBoardDto {
	private Long id;
	private Long membersId;
	private String title;
	private String content;
	private LocalDate createDate;
	private LocalDate modifiedDate;
	private Long categoriesId;
	private Long view;
	private Long groupNo;
	private Long groupOrder;
	private Long depth;
}
