package com.shengjia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.shengjia.bean.Category;
import com.shengjia.commons.Page;

public class CategoryDBO {
	Connection conn; // 数据库对象
	Statement stmt; // 数据库语句对象
	ResultSet rs; // 查询结果集对象
	String sql = null; // 查询语句字符串

	// 构造函数初始化数据库连接
	public CategoryDBO() {
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

	/**
	 * 增加Category
	 */
	public boolean addCategory(String category, String img, String name, String detail) {
		boolean flag = false;
		try {
			String sql = "insert into Category" + "(category,img,name,detail) values ('" + category + "','" + img
					+ "','" + name + "','" + detail + "');";
			System.out.println(sql);
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

	/**
	 * 删除Category
	 */
	public boolean removeCategory(String name) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "Category" + " where name='" + name + "'";
		System.out.println(sql);
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

	/**
	 * 修改材料内容
	 * 
	 */

	public boolean updateCategory(int id, String category, String img, String name, String detail) {
		boolean flag = false;
		sql = "update category set category='" + category + "',img='" + img + "',name='" + name + "',detail='" + detail
				+ "' where id='" + id + "'";
		System.out.println(sql);
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
	 * 根据category号查看Category
	 * 
	 */
	public ArrayList<Category> queryCaseByName(String category) {
		ArrayList<Category> cs = new ArrayList<Category>();
		sql = "select * from category where category='" + category + "'";
		System.out.println("查询：" + sql);

		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Category rem = new Category();// 一定要放在里面
				rem.setId(rs.getInt(1));
				rem.setCategory(rs.getString(2));
				rem.setImg(rs.getString(3));
				rem.setName(rs.getString(4));
				rem.setDetail(rs.getString(5));
				cs.add(rem);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cs;
	}

	/**
	 * 根据category号查看Category
	 * 
	 */
	public Category queryCaseByName1(String name) {
		ArrayList<Category> cs = new ArrayList<Category>();
		sql = "select * from category where name='" + name + "'";
		System.out.println("查询：" + sql);
		Category rem = new Category();// 一定要放在里面
		try {
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				rem.setId(rs.getInt(1));
				rem.setCategory(rs.getString(2));
				rem.setImg(rs.getString(3));
				rem.setName(rs.getString(4));
				rem.setDetail(rs.getString(5));
				cs.add(rem);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rem;
	}

	/**
	 * 根据用户查看的页码，查询封装分页信息的page对象
	 * 
	 * @param num
	 *            如果为null或者"",默认值为1,当前页：num 页面大小:pageSize
	 * @return
	 */
	public Page findpPage(String num, int pageSize, ArrayList<Category> totalRecords) {
		int pageNum = 1;
		if (num != null && !"".equals(num)) {
			pageNum = Integer.parseInt(num);
		}
		Page page = new Page(pageNum, totalRecords.size(), pageSize);

		ArrayList<Category> records = findPageRecords(totalRecords, page.getPageSize(), pageNum);
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
	private ArrayList<Category> findPageRecords(ArrayList<Category> totalRecords, int pageSize, int currentpage) {
		int start = (currentpage - 1) * pageSize;
		int end = 0;
		if (currentpage * pageSize >= totalRecords.size()) {
			end = totalRecords.size() - 1;
		} else {
			end = start + pageSize - 1;
		}
		for (int i = 0; i < totalRecords.size(); i++) {
			System.out.println("查询结果" + totalRecords.get(i).getImg());
		}
		System.out.println(start + ":::" + end);
		ArrayList<Category> sc = new ArrayList<Category>();

		for (int i = start; i <= end; i++) {
			sc.add(totalRecords.get(i));
		}
		return sc;
	}

	public static void main(String[] args) {
		CategoryDBO reDbo = new CategoryDBO();
		boolean sd = reDbo.addCategory("sfaa1", "zc", "mn", "3");
		System.out.println("插入是否成功" + sd);
		boolean sp = reDbo.removeCategory("sfaa1");
		System.out.println("删除是否成功" + sp);
		boolean m1 = reDbo.updateCategory(1, "67", "3", "sd", "3");
		System.out.println("是否修改成功：" + m1);
		ArrayList<Category> pCaseImg = reDbo.queryCaseByName("67");
		for (int i = 0; i < pCaseImg.size(); i++) {
			System.out.println("在这里查询；" + pCaseImg.get(i).getImg());
		}
		System.out.println("-----测试查看------");
		Category s = reDbo.queryCaseByName1("白色水泥");
		System.out.println("是否查到" + s);
	}

}
