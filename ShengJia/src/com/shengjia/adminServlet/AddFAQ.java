package com.shengjia.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.dao.FAQDBO;

/**
 * 添加FAQ :常见问题
 * 
 * @author zy
 *
 */
public class AddFAQ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddFAQ() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String category = request.getParameter("category");
		FAQDBO faqdbo = new FAQDBO();
		boolean b = faqdbo.addFAQ(question, answer, category);
		if (b) {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('添加成功')</script>");
		} else {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('添加失败')</script>");

		}
	}

}
