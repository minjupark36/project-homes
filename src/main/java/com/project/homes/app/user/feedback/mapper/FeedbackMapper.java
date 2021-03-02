package com.project.homes.app.user.feedback.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import com.project.homes.app.common.image.dto.ImageDto;
import com.project.homes.app.common.info.dto.InfoDto;
import com.project.homes.app.common.member.dto.MemberDto;
import com.project.homes.app.user.feedback.dto.FeedbackDto;
import com.project.homes.app.user.mainpage.dto.MainPageDto;

@Repository
@Mapper
public interface FeedbackMapper {

	List<FeedbackDto> getFeedbackList(int limit);

	boolean addFeedback(FeedbackDto feedbackDto);
	

}
