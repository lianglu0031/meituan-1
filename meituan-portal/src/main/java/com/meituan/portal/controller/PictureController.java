package com.meituan.portal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.meituan.common.Utils.PictureResult;
import com.meituan.portal.service.IPictureService;

@Controller
public class PictureController {
	
	@Autowired
	private IPictureService pictureService;
	@RequestMapping("/seller/picture")
	@ResponseBody
	public PictureResult uploadFile(MultipartFile file,HttpServletRequest request) {
		PictureResult result = pictureService.uploadPicture(file, request);
		return result;
	}
}
