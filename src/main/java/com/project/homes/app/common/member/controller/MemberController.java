package com.project.homes.app.common.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.homes.app.common.member.dto.MemberDto;
import com.project.homes.app.common.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberController {
	
	private final MemberService memberService;
	
	@GetMapping("/")
	public String index() {
		return "redirect:sign-in";
	}
	
	@GetMapping("/sign-in")
	public String loginForm(@RequestParam(name = "loginStatus", required = false) String loginStatus, Model model) {
		model.addAttribute("loginStatus", loginStatus);
		return "login/sign-in";
	}
	
	@PostMapping("/sign-in")
	@ResponseBody
	public String login(MemberDto memberDto) {
		return memberService.login(memberDto)+"";
	}
	
	@GetMapping("/sign-up")
	public String signUpForm() {
		return "login/sign-up";
	}
	
	@PostMapping("/sendMail")
	@ResponseBody
	public String sendMail(String email) {
		String key = memberService.sendMail(email);
		return key;
	}
	
	@PostMapping("/sign-up")
	@ResponseBody
	public String signUp(MemberDto memberDto){		
		boolean res= memberService.addMember(memberDto);
		System.out.println("=============");
		System.out.println(res);
		System.out.println("=============");
		return res+"";
	}

}
