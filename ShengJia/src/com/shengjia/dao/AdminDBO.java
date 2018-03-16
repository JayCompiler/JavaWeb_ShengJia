package com.shengjia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 * 
 * @author zy
 * @验证管理员身份
 */
public class AdminDBO {
	Connection conn; // 数据库对象
	Statement stmt; // 数据库语句对象
	ResultSet rs; // 查询结果集对象
	String sql = null; // 查询语句字符串

	// 构造函数初始化数据库连接
	 public AdminDBO() {
		try {
			// 获得数据库对象
			conn = DBHelper.getConnection();
			if(conn!=null){
				System.out.println("连接成功");
			}
			// 获得数据库查询语句对象
			stmt = conn.createStatement();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	//验证管理员用户名
	public boolean login(String username,String password) throws Exception{
		boolean flag=false;
		sql="select * from Administrator where username='" + username + "' and password='" + password + "'";
		rs=DBHelper.execSQL(sql);
		while(rs.next()){
			flag=true;
		}
		return flag;
	}
	public static void main(String[] args) throws Exception{
		AdminDBO adminDBO=new AdminDBO();
		boolean f=adminDBO.login("admin", "admin");
		System.out.println(f);
	}
}
