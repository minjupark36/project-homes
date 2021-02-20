package com.project.homes.app.common.image.dto;

import java.time.LocalDate;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor /*parameter없는 기본생성자 생성*/
@Setter
@Getter /*기본 getter/setter를 생성(lombok)*/
public class ImageDto {

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
	
	@Builder
	public ImageDto(int id, String hashtagsNames, String filepath, String originalFilename, String url, String sort,
			LocalDate createDate, int pnum, int view, int scrap) {
		super();
		this.id = id;
		this.hashtagsNames = hashtagsNames;
		this.filepath = filepath;
		this.originalFilename = originalFilename;
		this.url = url;
		this.sort = sort;
		this.createDate = createDate;
		this.pnum = pnum;
		this.view = view;
		this.scrap = scrap;
	}
	
	


			
}
