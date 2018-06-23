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

public class BatchDeleteArticle extends HttpServlet {

	/**
	 *
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 *用来处理文章的批量删除
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] articleIdList = request.getParameterValues("batchArticleId");
		Dao<Article> articleDao = DaoFactory.getArticleDao();
		for (String articleId : articleIdList) {
			articleDao.deleteById(Integer.parseInt(articleId));
		}
		request.getRequestDispatcher("allarticle.jsp").forward(request, response);
	}



}
