package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Article;

import dao.Dao;
import dao.DaoFactory;

public class DeleteArticle extends HttpServlet {

	/**
	 * 用来处理删除文章的业务逻辑
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Dao<Article> articleDao = DaoFactory.getArticleDao();
		articleDao.deleteById(id);
		request.getRequestDispatcher("allarticle.jsp").forward(request, response);
	}

	/**
	 * 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}


}
