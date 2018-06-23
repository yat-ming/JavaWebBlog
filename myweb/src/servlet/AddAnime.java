package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dao.DaoFactory;

import bean.Anime;

public class AddAnime extends HttpServlet {

	/**
	 *
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 *	用来处理添加动画列表请求。
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		int year = Integer.parseInt(request.getParameter("year"));
		String company = request.getParameter("company");
		String type = request.getParameter("type");
		Anime anime = new Anime();
		anime.setName(name);
		anime.setYear(year);
		anime.setCompany(company);
		anime.setType(type);
		Dao<Anime> animeDao = DaoFactory.getAnimeDao();
		animeDao.add(anime);
		request.getRequestDispatcher("allanime.jsp").forward(request, response);
	}


}
