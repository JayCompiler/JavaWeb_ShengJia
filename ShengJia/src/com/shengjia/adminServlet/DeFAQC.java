package com.shengjia.adminServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.FAQ;
import com.shengjia.bean.FaqCategory;
import com.shengjia.dao.FAQDBO;
import com.shengjia.dao.FaqCDAO;

public class DeFAQC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeFAQC() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);

		FaqCDAO mDbo = new FaqCDAO();
		FaqCategory faqc = mDbo.queryCaseById(id);

		// 删除底层
		FAQDBO faqdbo = new FAQDBO();
		ArrayList<FAQ> faq = faqdbo.queryCaseByName(faqc.getCategory());

		if (faq.size() > 0) {
			for (int i = 0; i < faq.size(); i++) {
				faqdbo.removeFAQ(faq.get(i).getId());
			}
		}
		boolean success = false;
		success = mDbo.removeCase(id);

		if (success) {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('删除成功');</script>");
		} else {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('删除失败')</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
