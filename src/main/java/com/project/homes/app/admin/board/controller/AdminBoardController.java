package com.project.homes.app.admin.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.project.homes.app.user.board.dto.BoardDto;
import com.project.homes.app.user.board.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AdminBoardController {
	
	private final AdminBoardService adminBoardService;
	private final BoardService boardService;
	private final AttachService attachService;
	private final MemberService memberService;
	
	/*게시판 전체리스트*/
	@GetMapping("/admin/board")
	public String boardList(Model model
			, @RequestParam(required = false) Map<String, Object> searchMap
			, @RequestParam(name="num", defaultValue="1") int num
			){
		
		PageHelper.startPage(num,15);
		PageInfo<BoardDto> pageInfo = new PageInfo<> (boardService.getBoardList(searchMap));
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("searchMap", searchMap);
		return "admin/board/boardList";
	}
	
	/*카테고리별 게시판 페이지*/
	@GetMapping("/admin/board/{categoriesId}")
	public String boardByCategory(Model model
					, @RequestParam(required = false) Map<String, Object> searchMap
					, @RequestParam(name="num", defaultValue="1") int num
					, @PathVariable Long categoriesId
					){
		PageHelper.startPage(num,15);
		PageInfo<BoardDto> pageInfo=new PageInfo<>(boardService.boardByCategory(searchMap,categoriesId));
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("searchMap", searchMap);
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
	
	/*게시글 form*/
	@GetMapping("/admin/board/insert")
	public String getinsertForm() {		
      return "admin/board/insertBoard";
	}
	
	/*게시글추가*/
	@ResponseBody
	@PostMapping("/admin/board/insert")
	public String insertBoard(@RequestParam("files") MultipartFile[] mfiles
			, BoardDto boardDto
			) {
		boolean res=true;
		
		boardService.saveBoardAndAttach(boardDto, mfiles);		
		return res+"";
	}
	
	/*게시글 detail페이지*/
	@GetMapping("/admin/board/detail")
	public String getBoardDetail(Model model
				,@RequestParam("id") long id
				,@RequestParam("categoriesId") long categoriesId
				) {
		model.addAttribute("board",boardService.getBoardDetail(id));
		model.addAttribute("categoriesId",categoriesId);
		model.addAttribute("replyList",boardService.getReplyList(id));
		model.addAttribute("view", boardService.countView(id));
		
		return "admin/board/boardDetail";
	}
	
	/*게시판 수정 @목록페이지*/
	@GetMapping("/admin/board/edit")
	public String getEditForm(@RequestParam("id") long id,
							  @RequestParam("categoriesId") long categoriesId,
							  Model model) {
		model.addAttribute("attachList",attachService.getAttachById(id));
		model.addAttribute("board",boardService.getBoardDetail(id));
		return "admin/board/editBoard";
	}
	
	@ResponseBody
	@PostMapping("/admin/board/edit")
	public String editBoard(@RequestParam("files") MultipartFile[] mfiles
			, BoardDto boardDto) {		
		return boardService.editBoard(boardDto, mfiles)+"";
		
	}
	
	/*답글form */
	@GetMapping("/admin/board/reply")
	public String getReplyForm(@RequestParam("pid") long id
				  ,@RequestParam("groupOrder") long groupOrder  
			      ,@RequestParam("depth") long depth
			      ,@RequestParam("categoriesId") long categoriesId
			      ,Model model) {
		model.addAttribute("id",id);
		model.addAttribute("groupOrder",groupOrder);
		model.addAttribute("depth",depth);
		model.addAttribute("categoriesId",categoriesId);
		return "admin/board/replyForm";
	}
	
	/*답글 insert*/
	@ResponseBody
	@PostMapping("/admin/board/reply")
	public String insertReply(HttpServletRequest request
							  , @RequestParam("files") MultipartFile[] mfiles
			                  ,BoardDto boardDto
			                  ,@RequestParam("id") long id
			                  ,@RequestParam("groupOrder") long groupOrder
			                  ,@RequestParam("categoriesId") long categoriesId) {
		boolean res=true;		
		boardService.insertReply(mfiles,boardDto,id,groupOrder,categoriesId);		
		return res+"";
	}
		
}
