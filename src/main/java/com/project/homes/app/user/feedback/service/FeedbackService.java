package com.project.homes.app.user.feedback.service;

import org.springframework.stereotype.Service;

import com.project.homes.app.user.feedback.mapper.FeedbackMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service 
public class FeedbackService {
	
	private final FeedbackMapper feedbackMapper;


}
