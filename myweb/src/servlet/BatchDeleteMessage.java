package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Message;

import dao.Dao;
import dao.DaoFactory;

public class BatchDeleteMessage extends HttpServlet {

	
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 *处理留言的批量删除
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] messageIdList = request.getParameterValues("batchMessageId");
		Dao<Message> messageDao = DaoFactory.getMessageDao();
		for (String messageId : messageIdList) {
			messageDao.deleteById(Integer.parseInt(messageId));
		}
		request.getRequestDispatcher("allmessage.jsp").forward(request, response);
	}


}
