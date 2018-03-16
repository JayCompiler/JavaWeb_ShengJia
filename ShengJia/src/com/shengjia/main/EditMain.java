package com.shengjia.main;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.dao.MainDao;

public class EditMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditMain() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String id1 = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		int id = Integer.parseInt(id1);
		MainDao faqdbo = new MainDao();
		Date date1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(date1);
		boolean b = faqdbo.updateCase(id, category, title, date, content);
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
