package com.shengjia.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.dao.FAQDBO;

public class EditFAQ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditFAQ() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String id1 = request.getParameter("id");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String category = request.getParameter("category");
		int id = Integer.parseInt(id1);
		FAQDBO faqdbo = new FAQDBO();
		boolean b = faqdbo.updateFAQ(id, question, answer, category);
		if (b) {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('修改成功');</script>");
		} else {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('修改失败');</script>");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
