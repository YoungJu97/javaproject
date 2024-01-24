package com.res.travel;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.res.service.IF_MemberService;
import com.res.service.IF_galleryService;
import com.res.vo.FilesVO;
import com.res.vo.GalleryVO;
import com.res.vo.GcommentVO;
import com.res.vo.MemberVO;



@RestController
public class Rcontroller {
	
	@Inject	
	IF_galleryService galleryservice;
	
	@Inject	
	IF_MemberService memberservice;
	
		@RequestMapping(value = "imgdel" , method = RequestMethod.POST)
		public int imgdel(@RequestBody FilesVO filevo) {
			galleryservice.deleteImg(filevo.getGallery_filename());
			return 0;
			
		} 
		@RequestMapping(value = "insertcomment" , method = RequestMethod.POST)
		public int insertcomment(@RequestBody GcommentVO gcmt) {
			galleryservice.commentinsert(gcmt);
			return 0;
			
		} 
		@RequestMapping(value = "updategood" , method = RequestMethod.POST)
		public int updategood(@RequestBody GalleryVO gallervo,@CookieValue(name="user_id") String userid) {
			galleryservice.updategood(gallervo);
			GalleryVO gvo=galleryservice.selectDetail(gallervo);
			
			return gvo.getGallery_good();
			
		} 
		
		@RequestMapping(value = "logchk" , method = RequestMethod.POST)
		public int logchk(MemberVO membervo) {	
		
			MemberVO mvo=memberservice.select(membervo.getUser_id());
			if(mvo == null) {
				return 0;
			}else {
			return 1;
			}
		} 
		
		@RequestMapping(value = "passchange" , method = RequestMethod.GET)
		public int passchange() {	
			
			return 0;
			}
		} 
		

