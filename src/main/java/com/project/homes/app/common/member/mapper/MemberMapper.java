package com.project.homes.app.common.member.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.homes.app.common.member.dto.MemberDto;

@Repository
@Mapper
public interface MemberMapper {

	boolean addMember(MemberDto memberDto);

}
