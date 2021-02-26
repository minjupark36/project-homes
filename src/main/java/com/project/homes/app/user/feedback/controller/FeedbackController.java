package com.project.homes.app.user.feedback.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.homes.app.user.feedback.mapper.FeedbackMapper;
import com.project.homes.app.user.feedback.service.FeedbackService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class FeedbackController {
	
	private final FeedbackService feedbackService;

	@Autowired
	private FeedbackMapper feedbackMapper;
	
	
	
}
