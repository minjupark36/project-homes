package com.project.homes.app.common.member.service;

import java.util.Optional;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.homes.app.common.member.dto.MemberDto;
import com.project.homes.app.common.member.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService {
	
	private final JavaMailSender javaMailSender;
	private final MemberMapper memberMapper;

	public String sendMail(String email) {
		
		Random random=new Random();  //난수 생성을 위한 랜덤 클래스
		String key="";  //인증번호 

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email); //스크립트에서 보낸 메일을 받을 사용자 이메일 주소 
		//입력 키를 위한 코드
		for(int i =0; i<3;i++) {
			int index=random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
			key+=(char)index;
		}
		int numIndex=random.nextInt(9999)+1000; //4자리 랜덤 정수를 생성
		key+=numIndex;
		message.setSubject("홈즈 회원가입 인증 이메일 입니다");
		message.setText("인증 번호는 "+key+" 입니다.\n받으신 인증번호를 홈페이지에 입력해 주시면 인증이 완료됩니다.\n감사합니다.");
		javaMailSender.send(message);
		
		return key;
	}

	public boolean addMember(MemberDto memberDto) {	

		int num = memberMapper.addMember(memberDto);
		
		if(num==1) {
			return true;
		}else {
			return false;		
		}

	}

	public boolean loginCheck(MemberDto memberDto) {
		
		MemberDto member = new MemberDto();
		member = memberMapper.loginCheck(memberDto);
		if(member!=null) {
			return true;
		}else {
			return false;
		}		
	}

	public MemberDto getUser(MemberDto memberDto) {
		
		MemberDto member = new MemberDto();
		member = memberMapper.getUser(memberDto);
		return member;
	}

	public boolean findPw(MemberDto memberDto) {
		
		String password = memberMapper.findPw(memberDto);
		
		if(password != null) {			
			return true;
		}else {
			return false;		
		}
	}

	public boolean sendPwMail(MemberDto memberDto) {
		
		
		String email = memberDto.getEmail();
		String password = memberMapper.findPw(memberDto);
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		
		message.setSubject("홈즈 비밀번호 확인메일 입니다.");
		message.setText("고객님의 비밀번호는 "+password+" 입니다.\n감사합니다.");
		javaMailSender.send(message);
		
		return true;
	}
	


}
