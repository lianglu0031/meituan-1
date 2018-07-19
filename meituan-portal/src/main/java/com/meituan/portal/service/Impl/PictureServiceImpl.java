package com.meituan.portal.service.Impl;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.meituan.common.Utils.IDUtils;
import com.meituan.common.Utils.PictureResult;
import com.meituan.portal.service.IPictureService;

@Service
public class PictureServiceImpl implements IPictureService {
	
	@Value("${FILI_UPLOAD_PATH}")
	private String FILI_UPLOAD_PATH;

	@Override
	public PictureResult uploadPicture(MultipartFile uploadFile,HttpServletRequest request) {
		try {
			// 上传文件功能实现
			// 判断文件是否为空
			if (uploadFile.isEmpty())
				return null;
			// 上传文件以日期为单位分开存放，可以提高图片的查询速度
//			String filePath = "/" + new SimpleDateFormat("yyyy").format(new Date()) + "/"
//					+ new SimpleDateFormat("MM").format(new Date()) + "/"
//					+ new SimpleDateFormat("dd").format(new Date());

			// 取原始文件名
			String originalFilename = uploadFile.getOriginalFilename();
			// 新文件名
			String newFileName = IDUtils.genImageName() + originalFilename.substring(originalFilename.lastIndexOf("."));
			 // 文件保存路径  
            String filePath = request.getSession().getServletContext().getRealPath("/") + "images/"  
                    + newFileName; 
            System.out.println(filePath);
            uploadFile.transferTo(new File(filePath));
			/*FileOutputStream fos = new FileOutputStream(FILI_UPLOAD_PATH+newFileName);
			BufferedOutputStream buf = new BufferedOutputStream(fos);
			InputStream is = uploadFile.getInputStream();
			int temp;
			while((temp = is.read())!=-1) {
				buf.write(temp);
			}
			buf.close();
			fos.close();
			is.close();*/
			return new PictureResult(0,newFileName);
			}catch(Exception e) {
				e.printStackTrace();
				return new PictureResult(1,"上传失败");
			}
		


	}
}
