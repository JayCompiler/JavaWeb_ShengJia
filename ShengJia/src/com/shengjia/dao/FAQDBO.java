package com.shengjia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.shengjia.bean.FAQ;
import com.shengjia.commons.Page;

public class FAQDBO {
	Connection conn; // 数据库对象
	Statement stmt; // 数据库语句对象
	ResultSet rs; // 查询结果集对象
	String sql = null; // 查询语句字符串

	// 构造函数初始化数据库连接
	public FAQDBO() {
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
	 * 增加FAQ
	 */
	public boolean addFAQ(String question, String answer, String category) {
		boolean flag = false;
		// 找到最后一个id号
		String sql1 = "select* from FAQ";
		try {
			@SuppressWarnings("unused")
			int id = 1;
			rs = stmt.executeQuery(sql1);
			if (rs.next()) {
				rs.last(); // 最后一行
				id = rs.getInt(1) + 1;
			}

			String sql = "insert into FAQ" + "(question,answer,category) values ('" + question + "','" + answer + "','"
					+ category + "');";
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
	 * 删除FAQ
	 */
	public boolean removeFAQ(int id) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "FAQ" + " where id=" + id;
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

	public boolean updateFAQ(int id, String question, String answer, String category) {
		boolean flag = false;
		sql = "update FAQ set question='" + question + "',answer='" + answer + "',category='" + category + "'where id='"
				+ id + "'";
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
	 * 根据id号查看FAQ
	 * 
	 */
	public FAQ queryFAQById(int id) {
		FAQ rem = new FAQ();
		sql = "select * from FAQ where id='" + id + "'";
		try {
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				rem.setId(rs.getInt("id"));
				rem.setQuestion(rs.getString(2));
				rem.setAnswer(rs.getString(3));
				rem.setCategory(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rem;
	}

	/**
	 * 根据category查看faq
	 * 
	 */
	public ArrayList<FAQ> queryCaseByName(String category) {
		ArrayList<FAQ> cs = new ArrayList<FAQ>();
		sql = "select * from faq where category='" + category + "'";
		System.out.println("查询：" + sql);

		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				FAQ rem = new FAQ();// 一定要放在里面
				rem.setId(rs.getInt(1));
				rem.setQuestion(rs.getString(2));
				rem.setAnswer(rs.getString(3));
				rem.setCategory(rs.getString(4));
				System.out.println("在这里，别跑了" + rem.getAnswer());
				cs.add(rem);
				System.out.println(cs.get(0).getAnswer());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		for (int i = 0; i < cs.size(); i++) {
			System.out.println("在这里查询；" + cs.get(i).getAnswer());
		}
		return cs;
	}

	/**
	 * 查看所有信息
	 * 
	 * @return
	 */
	public ArrayList<FAQ> queryAllFAQs() {
		sql = "select id from FAQ";
		ArrayList<Integer> id1 = new ArrayList<Integer>();
		int id = 0;
		ArrayList<FAQ> allcase = new ArrayList<FAQ>();
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
			FAQ rem = queryFAQById(id1.get(i));
			allcase.add(rem);
		}
		return allcase;
	}

	/**
	 * 根据用户查看的页码，查询封装分页信息的page对象
	 * 
	 * @param num
	 *            如果为null或者"",默认值为1,当前页：num 页面大小:pageSize
	 * @return
	 */
	public Page findpPage(String num, int pageSize, ArrayList<FAQ> totalRecords) {
		int pageNum = 1;
		if (num != null && !"".equals(num)) {
			pageNum = Integer.parseInt(num);
		}
		Page page = new Page(pageNum, totalRecords.size(), pageSize);

		ArrayList<FAQ> records = findPageRecords(totalRecords, page.getPageSize(), pageNum);
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
	private ArrayList<FAQ> findPageRecords(ArrayList<FAQ> totalRecords, int pageSize, int currentpage) {
		int start = (currentpage - 1) * pageSize;
		int end = 0;
		if (currentpage * pageSize >= totalRecords.size()) {
			end = totalRecords.size() - 1;
		} else {
			end = start + pageSize - 1;
		}
		for (int i = 0; i < totalRecords.size(); i++) {
			System.out.println("查询结果" + totalRecords.get(i).getAnswer());
		}
		System.out.println(start + ":::" + end);
		ArrayList<FAQ> sc = new ArrayList<FAQ>();

		for (int i = start; i <= end; i++) {
			sc.add(totalRecords.get(i));
		}
		return sc;
	}

	/**
	 * 测试
	 * 
	 * @param args
	 */

	public static void main(String[] args) {
		FAQDBO reDbo = new FAQDBO();
		boolean sd = reDbo.addFAQ("sfaa", "zc", "d");
		System.out.println("插入是否成功" + sd);

		boolean sp = reDbo.removeFAQ(1);
		System.out.println("删除是否成功" + sp);
		boolean m1 = reDbo.updateFAQ(2, "2", "3", "d");
		System.out.println("是否修改成功：" + m1);

		System.out.println("-----测试查看------");

		ArrayList<FAQ> pArrayList = reDbo.queryAllFAQs();

		for (FAQ FAQs : pArrayList) {
			System.out.println(FAQs.getQuestion() + ":" + FAQs.getAnswer());
		}
	}

}
