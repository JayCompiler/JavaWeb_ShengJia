package com.shengjia.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengjia.dao.AdminDBO;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// 验证用户名是否正确
		AdminDBO adminDBO = new AdminDBO();
		try {
			boolean isright = adminDBO.login(username, password);
			if (isright) {
				System.out.println("登录成功");
				request.getSession().setAttribute("username", username);
				response.sendRedirect("/ShengJia/SucServlet");
			} else {
				response.getWriter().print("<script languge='javascript'>history.go(-1);alert('用户名或者密码不正确')</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
