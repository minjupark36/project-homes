package com.project.homes.app.common.info.dto;

import java.time.LocalDate;

import com.project.homes.app.common.info.dto.InfoDto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor /*parameter없는 기본생성자 생성*/
@Setter
@Getter /*기본 getter/setter를 생성(lombok)*/
public class InfoDto {

	private int id;
	private String title;
	private String text;
	private String url;
	private String imageUrl;
	private int view;
	private LocalDate createDate;
	
	@Builder
	public InfoDto(int id, String title, String text, String url, String imageUrl, int view, LocalDate createDate) {
		super();
		this.id = id;
		this.title = title;
		this.text = text;
		this.url = url;
		this.imageUrl = imageUrl;
		this.view = view;
		this.createDate = createDate;
	}

}
