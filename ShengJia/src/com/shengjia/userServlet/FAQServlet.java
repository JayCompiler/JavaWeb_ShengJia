package com.shengjia.userServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.FAQ;
import com.shengjia.dao.FAQDBO;

public class FAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FAQServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id1=request.getParameter("id");
		int id=Integer.parseInt(id1);
		FAQDBO faqdbo=new FAQDBO();
		FAQ faq=faqdbo.queryFAQById(id);
		request.setAttribute("faq", faq);
		request.getRequestDispatcher("page/displayFAQ.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
