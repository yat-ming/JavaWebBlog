package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dao.DaoFactory;

import bean.Message;

public class AddMessage extends HttpServlet {

	/**
	 *get方法不做处理，转发给doPost();
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 *处理添加留言请求。
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String comment = request.getParameter("comment");
		Message message = new Message();
		message.setName(name);
		message.setDatetime(new Date());
		message.setContent(comment);
		Dao<Message> messageDao = DaoFactory.getMessageDao();
		messageDao.add(message);
		request.getRequestDispatcher("message.jsp").forward(request, response);
	}

}
