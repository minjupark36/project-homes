package com.project.homes.app.common.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.project.homes.app.common.member.dto.MemberDto;

public class Utils {
	
	public static MemberDto getMemberFromSession() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession(false);		
		
		if(session != null && session.getAttribute("user") != null) {
			return (MemberDto) session.getAttribute("user");
		} else {
			return null;
		}
	}
   
}
