package com.shengjia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shengjia.bean.FaqCategory;
/**
 * 
 * @author zy
 * 对成功案例的增删改查
 */
import com.shengjia.commons.Page;

public class FaqCDAO {
	Connection conn; // 数据库对象
	Statement stmt; // 数据库语句对象
	ResultSet rs; // 查询结果集对象
	String sql = null; // 查询语句字符串

	// 构造函数初始化数据库连接
	public FaqCDAO() {
		try {
			// 获得数据库对象
			conn = DBHelper.getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			// 获得数据库查询语句对象
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean addCase(String category) {
		boolean flag = false;
		// 找到最后一个id号
		String sql1 = "select* from faqcategory";
		try {
			int id = 1;
			rs = stmt.executeQuery(sql1);
			if (rs.next()) {
				rs.last(); // 最后一行
				id = rs.getInt(1) + 1;
			}
			String sql = "insert into faqcategory " + "(id,category) values ('" + id + "','" + category + "');";
			int count = stmt.executeUpdate(sql);
			if (count > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("插入数据有误");
			flag = false;
		}
		return flag;
	}

	public boolean removeCase(int id) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "faqcategory" + " where id=" + id;
		try {
			ret = stmt.executeUpdate(sql);
			if (ret > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.getStackTrace();
		}
		return flag;
	}

	public boolean updateCase(int id, String category) {
		boolean flag = false;
		sql = "update faqcategory set category='" + category + "'where id='" + id + "'";
		try {
			int count = stmt.executeUpdate(sql);
			if (count > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 通过id查找
	 * 
	 * @param id
	 * @return
	 */
	public FaqCategory queryCaseById(int id) {
		FaqCategory sCase = new FaqCategory();
		sql = "select * from faqcategory where id='" + id + "'";
		try {
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				sCase.setId(rs.getInt("id"));
				sCase.setCategory(rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sCase;
	}

	/**
	 * 查看所有成功案例
	 * 
	 * @return
	 */
	public ArrayList<FaqCategory> queryAllCase() {
		sql = "select id from FaqCategory";
		ArrayList<Integer> id1 = new ArrayList<Integer>();
		int id = 0;
		ArrayList<FaqCategory> allcase = new ArrayList<FaqCategory>();
		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				id = rs.getInt(1);
				id1.add(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int i = 0; i < id1.size(); i++) {
			FaqCategory sCase = queryCaseById(id1.get(i));
			allcase.add(sCase);
		}
		return allcase;
	}

	/**
	 * 查询记录条数
	 * 
	 * @return
	 */
	public int getTotalRecords() {
		List<FaqCategory> list = queryAllCase();
		int totalPage = list.size();
		return totalPage;
	}

	/**
	 * 根据用户查看的页码，查询封装分页信息的page对象
	 * 
	 * @param num
	 *            如果为null或者"",默认值为1
	 * @return
	 */
	public Page findpPage(String num, int pageSize) {
		int pageNum = 1;
		if (num != null && !"".equals(num)) {
			pageNum = Integer.parseInt(num);
		}
		Page page = new Page(pageNum, getTotalRecords(), pageSize);
		ArrayList<FaqCategory> records = findPageRecords(page.getStartIndex(), page.getPageSize());
		page.setRecord(records);
		return page;
	}

	/**
	 * 找到某一页的所有record
	 * 
	 * @param startIndex
	 * @param pageSize
	 * @return
	 */
	private ArrayList<FaqCategory> findPageRecords(int startIndex, int pageSize) {
		sql = "select * from FaqCategory limit" + " " + startIndex + "," + pageSize;
		System.out.println("+++++");
		System.out.println(sql);
		System.out.println("++++++");
		ArrayList<FaqCategory> sc = new ArrayList<FaqCategory>();
		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				FaqCategory sCase = new FaqCategory();
				sCase.setId(rs.getInt("id"));
				sCase.setCategory(rs.getString(2));
				sc.add(sCase);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sc;
	}

	public static void main(String[] args) throws Exception {
		/** 测试插入 **/
		System.out.println("-----测试插入------");
		FaqCDAO s = new FaqCDAO();
		boolean m = s.addCase("3");
		System.out.println("是否插入成功?" + m);
		/** 测试删除 **/
		System.out.println("-----测试删除------");
		System.out.println("是否删除成功" + s.removeCase(2));
		/** 测试修改 **/
		System.out.println("-----测试修改------");
		boolean m1 = s.updateCase(1, "s");
		System.out.println("是否修改成功：" + m1);
		System.out.println("-----测试查看------");

		ArrayList<FaqCategory> pArrayList = s.queryAllCase();

		for (FaqCategory successfulCase : pArrayList) {
			System.out.println(successfulCase.getId() + ":" + successfulCase.getCategory());
		}
	}
}
