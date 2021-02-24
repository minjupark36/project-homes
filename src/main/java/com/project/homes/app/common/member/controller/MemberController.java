package com.project.homes.app.common.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.project.homes.app.common.member.dto.MemberDto;
import com.project.homes.app.common.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberController {
	
	private final MemberService memberService;
	
	@GetMapping("/")
	public String index() {
		return "redirect:main";
	}
	
	@GetMapping("/sign-in")
	public String loginForm(Model model) {
		return "login/sign-in";
	}
		
	@PostMapping("/sign-in")
	@ResponseBody
	public String loginCheck(MemberDto memberDto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(memberService.loginCheck(memberDto)) {
			session.setAttribute("loginCheck",true);
			session.setAttribute("user", memberService.getUser(memberDto));
		}
        
		return memberService.loginCheck(memberDto)+"";
	}
	
	@GetMapping("/sign-up")
	public String signUpForm() {
		return "login/sign-up";
	}

	@PostMapping("/sign-up")
	@ResponseBody
	public String signUp(MemberDto memberDto){		
		boolean res= memberService.addMember(memberDto);
		System.out.println("=============");
		System.out.println(memberDto.getHashtagPreference());
		System.out.println("=============");
		return res+"";
	}
	
	@PostMapping("/sendMail")
	@ResponseBody
	public String sendMail(String email) {
		String key = memberService.sendMail(email);
		return key;
	}
	
	@GetMapping("/log-out")
	public String logOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:main";
	}
	
	@GetMapping("/findPw")
	public String findPwForm() {
		return "login/findPw";		
	}
	
	@PostMapping("/findPw")
	@ResponseBody
	public boolean findPw(MemberDto memberDto) {
		System.out.println("=================");
		System.out.println(memberDto);
		System.out.println("=================");
		
		if(memberService.findPw(memberDto)==true) {
			return memberService.sendPwMail(memberDto);
			
		}else {
			return false;
		}
	}
	
	

}
