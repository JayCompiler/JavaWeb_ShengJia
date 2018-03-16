package com.shengjia.userServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.dao.MessageDBO;


@SuppressWarnings("serial")
public class SuggestServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		MessageDBO mDbo =new MessageDBO();
		String name=request.getParameter("name");
		String telephone=request.getParameter("telephone");
		String message=request.getParameter("message");
		boolean success=mDbo.addMessage(name, telephone, message);
		if(success){
		/*	response.getWriter()
			.print("<script languge='javascript'>alert('提交成功,谢谢您的反馈');window.location.href='/ShengJia/page/contactUs.jsp';</script>");
*/	
			response.getWriter()
			.print("<script languge='javascript'>alert('提交成功,谢谢您的反馈');history.go(-1);</script>");	
		}else{
			response.getWriter()
			.print("<script languge='javascript'>history.go(-1);alert('提交失败，请重新提交')</script>");

		}
	}

}
