package com.project.homes.app.common.member.mapper;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.member.dto.MemberDto;

@Repository
@Mapper
public interface MemberMapper {

	int addMember(MemberDto memberDto);

	Optional<MemberDto> login(MemberDto memberDto);

}
