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

public class DeleteAnime extends HttpServlet {


	/**
	 *	用来处理删除一条动画列表的内容。
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		Dao<Anime> animeDao = DaoFactory.getAnimeDao();
		animeDao.deleteById(id);
		request.getRequestDispatcher("allanime.jsp").forward(request, response);
	}

	/**
	 *
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


}
