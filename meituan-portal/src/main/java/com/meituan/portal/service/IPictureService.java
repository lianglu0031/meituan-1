package com.meituan.portal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.meituan.common.Utils.PictureResult;

public interface IPictureService {

	PictureResult uploadPicture(MultipartFile uploadFile, HttpServletRequest request);
}
