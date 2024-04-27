package com.epl.file;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class Fileutil {
	
			@Resource(name="uploadcommunity")
				private String uploadcommunity; 
	 	
			public String getUploadcommunity() {
				return uploadcommunity;
			}

			public void setUploadcommunity(String uploadcommunity) {
				this.uploadcommunity = uploadcommunity;
			}


			@Resource(name="uploadPath")
			private String uploadPath; 
			
			public String getUploadPath() {
				return uploadPath;
			}

			public void setUploadPath(String uploadPath) {
				this.uploadPath = uploadPath;
			}

		
			@RequestMapping(value="/download", method=RequestMethod.GET)
			@ResponseBody  
			public FileSystemResource fileDownload(@RequestParam("filename") String fileName, HttpServletResponse response)throws IOException {
				File file = new File(uploadPath + "/" + fileName);
				fileName = URLEncoder.encode(fileName, "UTF-8");
				response.setContentType("application/download; utf-8");
				response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
				return new FileSystemResource(file);
			}
			@RequestMapping(value="/communityfile", method=RequestMethod.GET)
			@ResponseBody  
			public FileSystemResource communityDownload(@RequestParam("filename") String fileName, HttpServletResponse response)throws IOException {
				File file = new File(uploadcommunity + "/" + fileName);
				fileName = URLEncoder.encode(fileName, "UTF-8");
				response.setContentType("application/download; utf-8");
				response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
				return new FileSystemResource(file);
			}
			
		
			public String productUpload(MultipartFile file, String id,String title) throws IOException {        
				String filename=null;
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일HH시mm분ss초");
			    String timestamp = sdf.format(new Date());
			   
			    if (!file.isEmpty()) { 
			        String originalName = file.getOriginalFilename();
			        if (!originalName.isEmpty()) {
			            String saveName = timestamp + "_" + id +"_"+title+ "." + originalName.split("\\.")[1];
			            byte[] fileData = file.getBytes();    
			            File target = new File(uploadPath, saveName);
			            FileCopyUtils.copy(fileData, target);
			            filename  = saveName;
			        }
			    }
			    return filename;
			}
			public String communityUpload(MultipartFile file, String id) throws IOException {        
				String filename=null;
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일HH시mm분ss초");
			    String timestamp = sdf.format(new Date());
			    if (!file.isEmpty()) { 
			        String originalName = file.getOriginalFilename();
			        if (!originalName.isEmpty()) {
			            String saveName = timestamp + "_" + id + "." + originalName.split("\\.")[1];
			            byte[] fileData = file.getBytes();    
			            File target = new File(uploadcommunity, saveName);
			            FileCopyUtils.copy(fileData, target);
			            filename  = saveName;
			        }
			    }
			    return filename;
			}
		

			
}
