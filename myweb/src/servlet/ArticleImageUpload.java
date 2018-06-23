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

public class ArticleImageUpload extends HttpServlet {

	/**
	 *
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 *用来处理文章的图片插入。
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//图片上传的处理
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		String path = request.getSession().getServletContext().getRealPath("/");
		String imgpath = path+"image\\article\\";	//图片将放置的路径
		String temppath = path+"image\\article\\tempory";		//临时文件夹
		upload.setHeaderEncoding("UTF-8");
		factory.setSizeThreshold(1024 * 1024);
		File linshi = new File(temppath);
		factory.setRepository(linshi);
		upload.setSizeMax(1024 * 1024 * 5);		//图片最大不能超过5m
		String ajaxName = null;
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				String fileName = item.getName();
				System.out.println(fileName);
				ajaxName = fileName;
				long sizeInBytes = item.getSize();
				InputStream in = item.getInputStream();
				byte[] buffer = new byte[1024*128];		//缓冲内存为128kb
				int len = 0;
				fileName = imgpath+fileName;		//上传的完整路径
				OutputStream out = new FileOutputStream(fileName);
				while((len = in.read(buffer)) != -1) {
					out.write(buffer, 0, len);
				}
				out.close();
				in.close();
				break;							//只处理一次即可。
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		String imageContextPath= "/myweb/image/article/"+ajaxName;
		response.setContentType("text/html");
		String callback = request.getParameter("CKEditorFuncNum");
		PrintWriter out = response.getWriter();
		out.println("<script type=\"text/javascript\">");
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + imageContextPath + "',''" + ")");
        out.println("</script>");
		out.flush();
		out.close();
	}

}
