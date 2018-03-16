package com.shengjia.material;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.DetailMaterial;
import com.shengjia.commons.Page;
import com.shengjia.dao.DetailMaterialDAO;

public class DeMa extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeMa() {
		super();
	}

	protected void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得用户要看的页码，通过请求参数的形式传过来
		String pageNum = request.getParameter("num");

		// 获得名称
		String name = request.getParameter("name");
		System.out.println("这个name：" + name);
		// 传递名称，种类名称
		request.setAttribute("name", name);

		DetailMaterialDAO sDbo = new DetailMaterialDAO();
		ArrayList<DetailMaterial> sImg = sDbo.queryDetailMaterialByName(name);

		Page page = sDbo.findpPage(pageNum, 3, sImg);
		request.setAttribute("pageone", page);
		request.getRequestDispatcher("/AMa/anotherMa.jsp").forward(request, response);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		look(request, response);

	}

	private void look(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		show(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
