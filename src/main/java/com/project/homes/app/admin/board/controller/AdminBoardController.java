package com.project.homes.app.admin.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.project.homes.app.admin.board.dto.AdminBoardDto;
import com.project.homes.app.admin.board.service.AdminBoardService;
import com.project.homes.app.common.attach.service.AttachService;
import com.project.homes.app.common.member.service.MemberService;
import com.project.homes.app.admin.board.dto.AdminBoardDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AdminBoardController {
	
	private final AdminBoardService adminBoardService;
	private final AttachService attachService;
	private final MemberService memberService;
	
	/*게시판 메인페이지*/
	@GetMapping("/admin/board")
	public String boardList(Model model
			, @RequestParam(required = false) Map<String, Object> searchMap
			, @RequestParam(name="num", defaultValue="1") int num
			){
		
		PageHelper.startPage(num,15);
		PageInfo<AdminBoardDto> pageInfo = new PageInfo<> (adminBoardService.getBoardList(searchMap));
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("searchMap", searchMap);
		return "admin/board/boardList";
	}
	
	/*페이징*/
	@GetMapping("/admin/board/{num}")
	public String getBoardPage(Model model
			, @PathVariable int num
			, @RequestParam(required = false) Map<String, Object> searchMap) {		

		PageHelper.startPage(num,10);
		PageInfo<AdminBoardDto> pageInfo=new PageInfo<>(adminBoardService.getBoardList(searchMap));
		model.addAttribute("pageInfo",pageInfo);
		
		return "admin/board/boardList";
		
	}
	
	/*게시글 리스트 삭제*/
	@ResponseBody
	@PostMapping("admin/board")
	public String massiveDelete(@RequestParam("idArr[]") List<String> idArr) {
		
		System.out.println("=============================================");
		System.out.println(idArr);
		System.out.println("=============================================");
		
		int boardId = 0;
		
		for(String i : idArr) {
			boardId = Integer.parseInt(i);
			adminBoardService.deleteBoard(boardId);
		}
		return adminBoardService.deleteBoard(boardId)+"";
	}
	
	
}
