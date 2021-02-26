package com.project.homes.app.user.feedback.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.homes.app.user.feedback.dto.FeedbackDto;
import com.project.homes.app.user.feedback.mapper.FeedbackMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service 
public class FeedbackService {
	
	private final FeedbackMapper feedbackMapper;

	public List<FeedbackDto> getFeedbackList() {
		return feedbackMapper.getFeedbackList();
	}


}
