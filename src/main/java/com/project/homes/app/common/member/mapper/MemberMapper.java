package com.project.homes.app.common.member.mapper;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.member.dto.MemberDto;

@Repository
@Mapper
public interface MemberMapper {
	
	int addMember(MemberDto memberDto);

	MemberDto loginCheck(MemberDto memberDto);

	MemberDto getUser(MemberDto memberDto);

	String findPw(MemberDto memberDto);

}
