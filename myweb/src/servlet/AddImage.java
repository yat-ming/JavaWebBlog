package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Image;

import dao.Dao;
import dao.DaoFactory;

public class AddImage extends HttpServlet {

	/**
	 *跳转到doPost方法
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 *用来处理添加图片，包括图片的上传，和将数据插入数据库。	 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//图片上传的处理
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		String path = request.getSession().getServletContext().getRealPath("/");
		String imgpath = path+"image\\img\\";	//图片将放置的路径
		String temppath = path+"image\\img\\tempory";		//临时文件夹
		upload.setHeaderEncoding("UTF-8");
		factory.setSizeThreshold(1024 * 1024);
		File linshi = new File(temppath);
		factory.setRepository(linshi);
		upload.setSizeMax(1024 * 1024 * 5);		//图片最大不能超过5m
		String fileName = null;
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				fileName = item.getName();
				int index = fileName.indexOf("\\");
				if (index != -1) {
					fileName = fileName.substring(index);
				}
				;
				long sizeInBytes = item.getSize();
				InputStream in = item.getInputStream();
				byte[] buffer = new byte[1024*128];		//缓冲内存为128kb
				int len = 0;
				String fullFileName = imgpath+fileName;		//上传的完整路径
				OutputStream out = new FileOutputStream(fullFileName);
				while((len = in.read(buffer)) != -1) {
					out.write(buffer, 0, len);
				}
				out.close();
				in.close();
				break;
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("../image/img/"+fileName);
		
		//将新图片的信息插入到数据库
		Dao<Image> imageDao = DaoFactory.getImageDao();
		Image image = new Image();
		image.setName(fileName);
		image.setSrc("image/img/"+fileName);
		imageDao.add(image);
	}

	

}
