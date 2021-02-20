package com.project.homes.app.common.attach.dto;

import java.time.LocalDate;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class AttachDto {
	private long id;
	private long boardId;
	private String filename;
	private long filesize;
	private String filetype;
	private LocalDate createDate;
}
