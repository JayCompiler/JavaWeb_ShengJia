package com.shengjia.material;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.Category;
import com.shengjia.bean.DetailMaterial;
import com.shengjia.bean.ReMaterial;
import com.shengjia.commons.Page;
import com.shengjia.dao.CategoryDBO;
import com.shengjia.dao.DetailMaterialDAO;
import com.shengjia.dao.ReMaterialDBO;

public class OPMa extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OPMa() {
		super();
	}

	protected void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得用户要看的页码，通过请求参数的形式传过来
		String pageNum = request.getParameter("num");
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);

		request.setAttribute("id", id);
		ReMaterialDBO sDbo = new ReMaterialDBO();
		ReMaterial sCase = sDbo.queryMaterialById(id);

		System.out.println("这个id是" + id);
		CategoryDBO cDao = new CategoryDBO();
		ArrayList<Category> sImg = cDao.queryCaseByName(sCase.getCategory());
		Page page = cDao.findpPage(pageNum, 3, sImg);
		request.setAttribute("pageone", page);
		request.getRequestDispatcher("/AMa/lookMa.jsp").forward(request, response);

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
		request.getRequestDispatcher("/AMa/editMa.jsp").forward(request, response);

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		request.setAttribute("id", id);

		ReMaterialDBO sDbo = new ReMaterialDBO();

		ReMaterial reMaterial = sDbo.queryMaterialById(id);
		String category = reMaterial.getCategory();
		CategoryDBO cDbo = new CategoryDBO();
		ArrayList<Category> ct = cDbo.queryCaseByName(category);

		DetailMaterialDAO dao = new DetailMaterialDAO();
		// 删除第三层：
		if (ct.size() > 0) {
			for (int i = 0; i < ct.size(); i++) {
				ArrayList<DetailMaterial> dm = dao.queryDetailMaterialByName(ct.get(i).getName());
				if (dm.size() > 0) {
					for (int j = 0; j < dm.size(); j++) {
						dao.removeDetailMaterial(dm.get(j).getMaterialName());
					}
				}
			}
		}

		// 删除第二层
		cDbo.removeCategory(category);
		// 删除第一层
		sDbo.removeMaterial(id);

		request.getRequestDispatcher("/CasPage").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/AMa/addSuc.jsp").forward(request, response);

	}
}
