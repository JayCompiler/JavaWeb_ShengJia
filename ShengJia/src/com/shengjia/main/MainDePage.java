package com.shengjia.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.Main;
import com.shengjia.commons.Page;
import com.shengjia.dao.MainDao;

public class MainDePage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainDePage() {
		super();
	}

	protected void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得用户要看的页码，通过请求参数的形式传过来
		String pageNum = request.getParameter("num");
		String category = request.getParameter("category");
		request.setAttribute("category", category);
		MainDao cDao = new MainDao();
		String method = request.getParameter("method");
		ArrayList<Main> sImg = cDao.queryCaseByCategory(category);
		for (int i = 0; i < sImg.size(); i++) {
			System.out.println("在这里查询；" + sImg.get(i).getContent());
		}

		Page page = cDao.findpPage(pageNum, 8, sImg);
		request.setAttribute("pageone", page);
		if (method == null) {
			request.getRequestDispatcher("/main/caMain.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/AMain/AMain.jsp").forward(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		show(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
