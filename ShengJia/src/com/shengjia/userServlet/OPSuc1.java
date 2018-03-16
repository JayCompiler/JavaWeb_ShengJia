package com.shengjia.userServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.LookAndFeel;


import com.shengjia.bean.CaseImg;
import com.shengjia.bean.SuccessfulCase;
import com.shengjia.commons.Page;
import com.shengjia.dao.CaseImgDAO;
import com.shengjia.dao.SuccessfulCaseDBO;


public class OPSuc1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public OPSuc1() {
        super();
    }
    
    
    protected void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//获得用户要看的页码，通过请求参数的形式传过来
		String pageNum=request.getParameter("num");	
		String id1=request.getParameter("id");
		int id=Integer.parseInt(id1);
		
		request.setAttribute("id", id);
		SuccessfulCaseDBO sDbo=new SuccessfulCaseDBO();
		SuccessfulCase sCase=sDbo.queryCaseById(id);
		request.setAttribute("sCase", sCase);
		System.out.println("这个id是"+id);
		CaseImgDAO cDao=new CaseImgDAO();
		ArrayList<CaseImg> sImg=cDao.queryCaseByName(sCase.getCasename());
		
		for (int i = 0; i < sImg.size(); i++) {
			System.out.println("在这里查询；"+sImg.get(i).getImg());
		}
		
		Page page=cDao.findpPage(pageNum,3,sImg);
		request.setAttribute("pageone", page);
		request.getRequestDispatcher("/page/DSCase.jsp").forward(request, response);

	}
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		look(request,response);
		
	}

	private void look(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		show(request, response);	
	}

	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
