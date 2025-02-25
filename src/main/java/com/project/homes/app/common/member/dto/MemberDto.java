package com.project.homes.app.common.member.dto;

import java.time.LocalDate;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Getter
@Setter
public class MemberDto {
	
	private Long id;
	private String email;
	private String password;
	private String name;
	private String gender;
	private LocalDate createDate;
	private LocalDate modifiedDate;
	private Long pwQuestion;
	private String pwAnswer;
	private String role;
	private String hashtagPreference;
	
	@Builder
	public MemberDto(Long id, String email, String password, String name, String gender, LocalDate createDate,
			LocalDate modifiedDate, Long pwQuestion, String pwAnswer, String role, String hashtagPreference) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.pwQuestion = pwQuestion;
		this.pwAnswer = pwAnswer;
		this.role = role;
		this.hashtagPreference = hashtagPreference;
	}
	
	
	
}
