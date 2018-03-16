package com.shengjia.adminServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.CaseImg;
import com.shengjia.bean.SuccessfulCase;
import com.shengjia.commons.Page;
import com.shengjia.dao.CaseImgDAO;
import com.shengjia.dao.SuccessfulCaseDBO;

public class OPSuc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OPSuc() {
		super();
	}

	protected void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得用户要看的页码，通过请求参数的形式传过来
		String pageNum = request.getParameter("num");
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);

		request.setAttribute("id", id);
		SuccessfulCaseDBO sDbo = new SuccessfulCaseDBO();
		SuccessfulCase sCase = sDbo.queryCaseById(id);
		System.out.println("这个id是" + id);
		CaseImgDAO cDao = new CaseImgDAO();
		ArrayList<CaseImg> sImg = cDao.queryCaseByName(sCase.getCasename());

		for (int i = 0; i < sImg.size(); i++) {
			System.out.println("在这里查询；" + sImg.get(i).getImg());
		}

		Page page = cDao.findpPage(pageNum, 3, sImg);
		request.setAttribute("pageone", page);
		request.getRequestDispatcher("/Asuc/lookSuc.jsp").forward(request, response);

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
		show(request, response);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		request.setAttribute("id", id);
		request.getRequestDispatcher("/Asuc/editSuc.jsp").forward(request, response);

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		request.setAttribute("id", id);
		SuccessfulCaseDBO sDbo = new SuccessfulCaseDBO();
		SuccessfulCase fCase = sDbo.queryCaseById(id);
		String casename = fCase.getCasename();
		sDbo.removeCase(id);
		CaseImgDAO sDao = new CaseImgDAO();
		boolean b = sDao.removeCaseImgbyName(casename);
		if (b) {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('删除成功')</script>");
		} else {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('删除失败')</script>");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Asuc/addSuc.jsp").forward(request, response);

	}
}
