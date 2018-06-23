package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Image;

import dao.Dao;
import dao.DaoFactory;

public class BatchDeleteImage extends HttpServlet {

	/**
	 *
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 *处理批量删除图片。
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] imageIdList = request.getParameterValues("batchImageId");
		Dao<Image> imageDao = DaoFactory.getImageDao();
		for (String imageId : imageIdList) {
			imageDao.deleteById(Integer.parseInt(imageId));
		}
		request.getRequestDispatcher("allimage.jsp").forward(request, response);
	}


}
