package com.shengjia.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.Message;
import com.shengjia.dao.MessageDBO;

public class DetailMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetailMessage() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		MessageDBO mDbo = new MessageDBO();
		Message message = mDbo.queryMessageById(id);
		request.setAttribute("message", message);
		request.getRequestDispatcher("adminpage/displayMessage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
