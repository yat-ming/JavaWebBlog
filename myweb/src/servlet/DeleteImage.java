package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Image;

import dao.Dao;
import dao.DaoFactory;

public class DeleteImage extends HttpServlet {


	/**
	 *处理删除文件操作。
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		Dao<Image> imageDao = DaoFactory.getImageDao();
		Image image = imageDao.find(id);
		String path = request.getSession().getServletContext().getRealPath("/");//获取到项目根目录
		String filePath = path+"image\\img\\"+image.getName();
		File file = new File(filePath);
		if(file.delete()){
			imageDao.deleteById(id);
		}
		request.getRequestDispatcher("allimage.jsp").forward(request, response);
	}

	/**
	 *
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}


}
