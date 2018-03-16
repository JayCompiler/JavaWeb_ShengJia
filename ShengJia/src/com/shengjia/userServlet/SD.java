package com.shengjia.userServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.bean.SuccessfulCase;
import com.shengjia.dao.SuccessfulCaseDBO;

/**
 * 显示成功案例详细信息
 * @author zy
 *
 */
public class SD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id1=request.getParameter("id");
		int id=Integer.parseInt(id1);
		SuccessfulCaseDBO sDbo=new SuccessfulCaseDBO();
		SuccessfulCase sCase=sDbo.queryCaseById(id);
		request.setAttribute("sCase", sCase);
		request.getRequestDispatcher("/page/DSCase.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
