package com.shengjia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 * 
 * @author zy
 * @连接数据库
 */

public class DBHelper {
	// 数据库驱动
	private static final String driver = "com.mysql.jdbc.Driver";
	// 连接数据库url地址
	private static final String url = "jdbc:mysql://localhost:3306/shengjia?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
	// 数据库登录名和密码
	private static final String username = "root";
	private static final String password = "zy211218";
	private static Connection conn = null;
	private static PreparedStatement stmt=null;
	private static ResultSet rs=null;

	// 静态代码块加载驱动
	static {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			System.out.println("找不到驱动类");
			e.printStackTrace();
		}
	}

	// 单例模式,创建数据库连接
	public static Connection getConnection() throws Exception {
		if (conn == null) {
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		}
		return conn;
	}

	// 执行Sql语句
	// 动态参数
	public static ResultSet execSQL(String sql, Object... args) throws Exception {
		// 连接数据库
		getConnection();
		// 执行动态SQL语句
		stmt = conn.prepareStatement(sql);
		for (int i = 0; i < args.length; i++) {
			stmt.setObject(i + 1, args[i]);
		}
		stmt.execute();
		// 获得结果集
		return stmt.getResultSet();
	}

	// 关闭数据库
	public static void close() {
		// 关闭数据集
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("关闭数据集");
		}
		//关闭声明
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("关闭声明");
		}
		//关闭连接对象
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("关闭连接对象");
		}
		
	}

	public static void main(String[] args) {
		try {
			Connection connection = DBHelper.getConnection();
			if (connection != null) {
				System.out.println("数据库连接正常");
			} else {
				System.out.println("数据库连接异常");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBHelper.close();
	}
}
