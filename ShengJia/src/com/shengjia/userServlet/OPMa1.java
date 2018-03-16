package com.shengjia.userServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.Category;
import com.shengjia.bean.ReMaterial;
import com.shengjia.commons.Page;
import com.shengjia.dao.CategoryDBO;
import com.shengjia.dao.ReMaterialDBO;


public class OPMa1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public OPMa1() {
        super();
    }
    
    
    protected void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//获得用户要看的页码，通过请求参数的形式传过来
		String pageNum=request.getParameter("num");	
		String id1=request.getParameter("id");
		int id=Integer.parseInt(id1);
		
		request.setAttribute("id", id);
		ReMaterialDBO sDbo=new ReMaterialDBO();
		ReMaterial sCase=sDbo.queryMaterialById(id);
		
		System.out.println("这个id是"+id);
		CategoryDBO cDao=new CategoryDBO();
		ArrayList<Category> sImg=cDao.queryCaseByName(sCase.getCategory());	
		Page page=cDao.findpPage(pageNum,3,sImg);
		request.setAttribute("pageone", page);
		request.getRequestDispatcher("/page/lookMa.jsp").forward(request, response);

	}
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			look(request,response);
		
	}

	private void look(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		show(request, response);	
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
