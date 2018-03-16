package com.shengjia.adminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.shengjia.dao.MessageDBO;


public class DeleteMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteMessage() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String id1=request.getParameter("id");
		int id=Integer.parseInt(id1);
		MessageDBO mDbo =new MessageDBO();
		boolean success=mDbo.removeMessage(id);
		if(success){
			response.sendRedirect("/ShengJia/mesPage");
		}else{
			response.getWriter()
			.print("<script languge='javascript'>history.go(-1);alert('删除失败')</script>");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
