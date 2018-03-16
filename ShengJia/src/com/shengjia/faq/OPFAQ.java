package com.shengjia.faq;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.FAQ;
import com.shengjia.commons.Page;
import com.shengjia.dao.FAQDBO;

public class OPFAQ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OPFAQ() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
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

		FAQDBO cDao = new FAQDBO();

		ArrayList<FAQ> sImg = cDao.queryCaseByName(category);

		for (int i = 0; i < sImg.size(); i++) {
			System.out.println("在这里查询；" + sImg.get(i).getAnswer());
		}

		Page page = cDao.findpPage(pageNum, 1, sImg);
		request.setAttribute("pageone", page);
		request.setAttribute("category", category);
		request.getRequestDispatcher("/page/displayFAQ.jsp").forward(request, response);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		request.setAttribute("id", id);
		request.getRequestDispatcher("/AFaq/editFAQ.jsp").forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		request.setAttribute("id", id);
		FAQDBO faqdbo = new FAQDBO();
		boolean b = faqdbo.removeFAQ(id);
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
		request.getRequestDispatcher("/AFaq/addFAQ.jsp").forward(request, response);
	}
}
