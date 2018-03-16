package com.shengjia.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.dao.FaqCDAO;

/**
 * 添加FAQ :常见问题
 * 
 * @author zy
 *
 */
public class EditFAQC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditFAQC() {
		super();
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
		String category = request.getParameter("category");
		int id = Integer.parseInt(request.getParameter("id"));

		FaqCDAO faqdbo = new FaqCDAO();
		boolean b = faqdbo.updateCase(id, category);
		if (b) {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('修改成功')</script>");
		} else {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('修改失败')</script>");

		}
	}

}
