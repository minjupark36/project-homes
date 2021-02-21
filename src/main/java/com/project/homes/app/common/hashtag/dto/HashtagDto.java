package com.project.homes.app.common.hashtag.dto;

import java.time.LocalDate;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class HashtagDto {
	
	private int id;
	private String name;
	private LocalDate createDate;
	

	
}
