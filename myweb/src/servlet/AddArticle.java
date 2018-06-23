package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Article;

import dao.Dao;
import dao.DaoFactory;

public class AddArticle extends HttpServlet {

	/**
	 *转发到doPost方法。
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 *处理往数据库中添加新文章的请求。
	 **/
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("ckeditor");
		Date date = new Date();
		Article article = new Article();
		article.setTitle(title);
		article.setDate(date);
		article.setContent(content);
		Dao<Article> articleDao = DaoFactory.getArticleDao();
		articleDao.add(article);
		request.getRequestDispatcher("allarticle.jsp").forward(request, response);
	}

}
