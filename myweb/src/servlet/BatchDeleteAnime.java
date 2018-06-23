package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Anime;

import dao.Dao;
import dao.DaoFactory;

public class BatchDeleteAnime extends HttpServlet {

	
	/**
	 *
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 *用来处理批量删除动画列表内容。
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] animeIdList = request.getParameterValues("batchAnimeId");
		Dao<Anime> animeDao = DaoFactory.getAnimeDao();
		for (String animeId : animeIdList) {
			animeDao.deleteById(Integer.parseInt(animeId));
		}
		request.getRequestDispatcher("allanime.jsp").forward(request, response);
	}


}
