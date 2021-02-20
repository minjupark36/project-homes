package com.project.homes.app.user.scrap.dto;

import java.time.LocalDate;

import com.project.homes.app.common.image.dto.ImageDto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor /*parameter없는 기본생성자 생성*/
@Setter
@Getter /*기본 getter/setter를 생성(lombok)*/
public class ScrapDto {

	private long id;
	private long membersId;
	private long imagesId;
	private LocalDate createDate;
	private ImageDto imageDto;
	
	@Builder /*모델 객체를 생성할 때 Builder를 자동으로 추가*/
	public ScrapDto(long id, long membersId, long imagesId, LocalDate createDate, ImageDto imageDto) {
		this.id = id;
		this.membersId = membersId;
		this.imagesId = imagesId;
		this.createDate = createDate;
		this.imageDto = imageDto;
	}
			
}
