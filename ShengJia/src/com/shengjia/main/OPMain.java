package com.shengjia.main;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.Main;
import com.shengjia.commons.Page;
import com.shengjia.dao.MainDao;

public class OPMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OPMain() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		String category = request.getParameter("category");
		System.out.println("这里的category" + category);
		System.out.println(method);
		if (method.equals("look")) {
			look(request, response);
		} else if (method.equals("edit")) {
			edit(request, response);
		} else if (method.equals("delete")) {
			delete(request, response);
		} else if (method.equals("add")) {
			add(request, response);
		}
	}

	private void look(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 获得用户要看的页码，通过请求参数的形式传过来
		String pageNum = request.getParameter("num");
		// 当前类别
		String category = request.getParameter("category");

		MainDao cDao = new MainDao();

		ArrayList<Main> sImg = cDao.queryCaseByCategory(category);

		Page page = cDao.findpPage(pageNum, 1, sImg);
		request.setAttribute("pageone", page);
		request.setAttribute("category", category);
		request.getRequestDispatcher("/AMain/lookMain.jsp").forward(request, response);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		request.setAttribute("id", id);
		request.getRequestDispatcher("/AFaq/editFAQ.jsp").forward(request, response);

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		request.setAttribute("id", id);
		MainDao faqdbo = new MainDao();
		boolean b = faqdbo.removeCase(id);
		if (b) {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('删除成功')</script>");
		} else {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('删除失败')</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		System.out.println("title" + title);
		System.out.println("content" + content);

		MainDao faqdbo = new MainDao();
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
