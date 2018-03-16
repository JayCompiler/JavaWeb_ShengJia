package com.shengjia.material;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.DetailMaterial;
import com.shengjia.dao.CategoryDBO;
import com.shengjia.dao.DetailMaterialDAO;

public class OPCas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OPCas() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		System.out.println(method);
		if (method.equals("edit")) {
			edit(request, response);
		} else if (method.equals("add")) {
			add(request, response);
		} else if (method.equals("delete")) {
			delete(request, response);
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		request.setAttribute("id", id);
		request.getRequestDispatcher("/AMa/editCas.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/AMa/addcas.jsp").forward(request, response);

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		/*
		 * String id1 = request.getParameter("id"); int id =
		 * Integer.parseInt(id1);
		 */

		String catname = request.getParameter("name");

		CategoryDBO cDbo = new CategoryDBO();

		DetailMaterialDAO dm = new DetailMaterialDAO();
		ArrayList<DetailMaterial> dms = dm.queryDetailMaterialByName(catname);

		// 删除第三层：
		if (dms.size() > 0) {
			for (int i = 0; i < dms.size(); i++) {
				dm.removeDetailMaterial(dms.get(i).getMaterialName());
			}
		}
		boolean b = cDbo.removeCategory(catname);
		if (b) {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('删除成功')</script>");
		} else {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('删除失败')</script>");
		}
	}
}
