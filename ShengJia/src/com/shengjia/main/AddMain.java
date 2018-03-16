package com.shengjia.main;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.dao.MainDao;

/**
 * 添加FAQ :常见问题
 * 
 * @author zy
 *
 */
public class AddMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddMain() {
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
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		MainDao faqdbo = new MainDao();
		System.out.println("category" + category);
		System.out.println("title" + title);
		System.out.println("category" + content);
		Date date1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(date1);
		boolean b = faqdbo.addCase(category, title, date, content);
		if (b) {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('添加成功')</script>");
		} else {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('添加失败')</script>");

		}
	}

}
