package com.project.homes.app.user.mainpage.dto;

import java.time.LocalDate;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@Getter
@Setter
public class MainPageDto {
	private int id;
	private String hashtagsNames;
	private String filepath;
	private String originalFilename;
	private String url;
	private String sort;
	private LocalDate createDate;
	private int pnum;
	private int view;
	private int scrap;
	private String content;
}
