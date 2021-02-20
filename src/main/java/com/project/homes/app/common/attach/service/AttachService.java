package com.project.homes.app.common.attach.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.homes.app.common.attach.dto.AttachDto;
import com.project.homes.app.common.attach.mapper.AttachMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AttachService {
	private final AttachMapper attachMapper;
	
	//첨부파일 insert
		@Transactional
		public String insertAttach(@RequestParam("files")MultipartFile[] mfiles, @RequestParam("id") long id) {
		      try {
		         for(int i=0;i<mfiles.length;i++) {
		        	 if(!mfiles[i].isEmpty()) {	
						String filename = mfiles[i].getOriginalFilename();					
						long filesize = mfiles[i].getSize();					
						String filetype = mfiles[i].getContentType();
						HashMap<String,Object> map = new HashMap<String,Object>();
						map.put("id", id);
						map.put("filename", filename);
						map.put("filesize", filesize);
						map.put("filetype", filetype);
						attachMapper.insertAttach(map);
						//폴더에 저장
						String uploadFolder = "C:\\javaWeb\\tjoeun-project-homes\\src\\main\\webapp\\WEB-INF\\upload";
						File saveFile = new File(uploadFolder, filename);
						mfiles[i].transferTo(saveFile);
		        	 }
	       	 }
		         return "true";
		      } catch (Exception e) {
		         e.printStackTrace();
		         return "파일 저장 실패";
		      }
		   }
	//첨부파일 삭제
	@Transactional
	public long deleteAttach(@RequestParam("id") long id) {
		return attachMapper.deleteAttach(id);
	}
	
	//해당 게시판 첨부파일 리스트
	public List<AttachDto> getAttachById(@RequestParam("id") long id){
		return attachMapper.getAttachById(id);
	}
		
		
}
