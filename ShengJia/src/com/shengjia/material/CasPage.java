package com.shengjia.material;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.commons.Page;
import com.shengjia.dao.ReMaterialDBO;

public class CasPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CasPage() {
		super();
	}

	protected void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得用户要看的页码，通过请求参数的形式传过来
		String pageNum = request.getParameter("num");
		ReMaterialDBO sDbo = new ReMaterialDBO();
		Page page = sDbo.findpPage(pageNum, 3);
		request.setAttribute("pageone", page);
		request.getRequestDispatcher("/AMa/cas.jsp").forward(request, response);
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
