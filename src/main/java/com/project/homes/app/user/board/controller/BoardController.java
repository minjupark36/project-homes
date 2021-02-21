package com.project.homes.app.user.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.project.homes.app.common.attach.service.AttachService;
import com.project.homes.app.user.board.dto.BoardDto;
import com.project.homes.app.user.board.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService boardService;
	private final AttachService attachService;
	
	//게시판 전체 리스트 보이기
	@GetMapping("/user/board")
	public String boardList(Model model
							, @RequestParam(required = false) Map<String, Object> searchMap
							, @RequestParam(name="num", defaultValue="1") int num
							){
		PageHelper.startPage(num,15);
		PageInfo<BoardDto> pageInfo=new PageInfo<>(boardService.getBoardList(searchMap));
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("searchMap", searchMap);
		return "user/board/boardList";
	}
	
	//카테고리별 게시판 페이지
	@GetMapping("/user/board/{categoriesId}")
	public String boardByCategory(Model model
					, @RequestParam(required = false) Map<String, Object> searchMap
					, @RequestParam(name="num", defaultValue="1") int num
					, @PathVariable Long categoriesId
					){
		PageHelper.startPage(num,15);
		PageInfo<BoardDto> pageInfo=new PageInfo<>(boardService.boardByCategory(searchMap,categoriesId));
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("searchMap", searchMap);
		return "user/board/boardList";
	}
	
	//게시판 detail페이지
	@GetMapping("/user/board/detail")
	public String getBoardDetail(Model model
				,@RequestParam("id") long id
				,@RequestParam("categoriesId") long categoriesId
				) {
		model.addAttribute("boardDetail",boardService.getBoardDetail(id));
		model.addAttribute("categoriesId",categoriesId);
		model.addAttribute("replyList",boardService.getReplyList(id));
		model.addAttribute("view", boardService.countView(id));
		
		return "user/board/boardDetail";
	}
	
	//detail페이지에서 id 받아 삭제하기
	@ResponseBody
	@DeleteMapping("/user/board/detail")
	public String deleteBoard(@RequestParam("id") long id) {
		
		boardService.deleteBoard(id);
		return id+"";
	}
	
	//다음(page=2) 혹은 이전(page=1) 게시판 보여주기
		@PostMapping("/user/board/detail")
		@ResponseBody
		public String getNextBoard(@RequestParam("id") long id,@RequestParam("page") int page) {
			String info=null;
			if(page==2) {
				BoardDto nextBoard=boardService.getNextBoard(id);
				long nextId=nextBoard.getId();
				long nextCategoriesId=nextBoard.getCategoriesId();
				info=nextId+","+nextCategoriesId;
			}
			else if(page==1) {
				BoardDto preBoard=boardService.getPreBoard(id);
				long preId=preBoard.getId();
				long preCategoriesId=preBoard.getCategoriesId();
				info=preId+","+preCategoriesId;	
			}
			return info;
		}
	
	//detail페이지에서 게시판id 받아 수정 form 
	@GetMapping("/user/board/edit")
	public String getEditForm(@RequestParam("id") long id,
							  @RequestParam("categoriesId") long categoriesId,
							  Model model) {
		model.addAttribute("attachList",attachService.getAttachById(id));
		model.addAttribute("boardDetail",boardService.getBoardDetail(id));
		return "user/board/editBoard";
	}
	
	//게시판 수정하기
	@ResponseBody
	@PostMapping("/user/board/edit")
	public String editBoard(@RequestParam("files") MultipartFile[] mfiles
			, BoardDto boardDto) {		
		return boardService.editBoard(boardDto, mfiles)+"";
		
	}
	//게시판 글쓰기form 보여주기
	@GetMapping("/user/board/insert")
	public String getinsertForm() {
		
      return "user/board/insertBoard";
	}
	//게시판 insert하기
	@ResponseBody
	@PostMapping("/user/board/insert")
	public String insertBoard(@RequestParam("files") MultipartFile[] mfiles
			, BoardDto boardDto
			) {
		boolean res=true;
//		
//		MemberDto memberDto = Utils.getMemberFromSession();
//		boardDto.setMemberId(memberDto.getId());
//		
		boardService.saveBoardAndAttach(boardDto, mfiles);		
		return res+"";
	}
	
	//답글 form 보여주기
	@GetMapping("/user/board/reply")
	public String getReplyForm(@RequestParam("pid") long id
				  ,@RequestParam("groupOrder") long groupOrder  
			      ,@RequestParam("depth") long depth
			      ,@RequestParam("categoriesId") long categoriesId
			      ,Model model) {
		model.addAttribute("id",id);
		model.addAttribute("groupOrder",groupOrder);
		model.addAttribute("depth",depth);
		model.addAttribute("categoriesId",categoriesId);
		return "user/board/replyForm";
	}
	
	//답글 insert
	@ResponseBody
	@PostMapping("/user/board/reply")
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
