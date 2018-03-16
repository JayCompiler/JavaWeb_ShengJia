package com.shengjia.faq;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.FAQ;
import com.shengjia.bean.FaqCategory;
import com.shengjia.commons.Page;
import com.shengjia.dao.FAQDBO;
import com.shengjia.dao.FaqCDAO;

public class FAQPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FAQPage() {
		super();
	}

	protected void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得用户要看的页码，通过请求参数的形式传过来
		String pageNum = request.getParameter("num");
		// 当前类别id
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);

		request.setAttribute("id", id);
		FaqCDAO sDbo = new FaqCDAO();
		FaqCategory sCase = sDbo.queryCaseById(id);
		String category = sCase.getCategory();
		request.setAttribute("category", category);

		System.out.println("这个id是" + id);
		FAQDBO cDao = new FAQDBO();

		ArrayList<FAQ> sImg = cDao.queryCaseByName(sCase.getCategory());

		for (int i = 0; i < sImg.size(); i++) {
			System.out.println("在这里查询；" + sImg.get(i).getAnswer());
		}

		Page page = cDao.findpPage(pageNum, 5, sImg);
		request.setAttribute("pageone", page);
		request.getRequestDispatcher("/page/FAQ.jsp").forward(request, response);

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
