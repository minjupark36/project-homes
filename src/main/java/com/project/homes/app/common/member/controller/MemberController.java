package com.project.homes.app.common.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.homes.app.common.member.service.MemberService;
import com.project.homes.app.common.image.service.ImageService;
import com.project.homes.app.user.mainpage.service.MainPageService;
import com.project.homes.app.user.scrap.service.ScrapService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberController {
	
	@GetMapping("/")
	public String index() {
		return "redirect:sign-in";
	}
	
	@GetMapping("/sign-in")
	public String loginUserForm(@RequestParam(name = "loginStatus", required = false) String loginStatus, Model model) {
		model.addAttribute("loginStatus", loginStatus);
		return "login/sign-in";
	}
	
	@GetMapping("/sign-up")
	public String userSignUpForm() {
		return "login/sign-up";
	}

}
