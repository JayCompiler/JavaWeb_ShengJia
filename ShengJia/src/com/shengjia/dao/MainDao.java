package com.shengjia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.shengjia.bean.Main;
/**
 * 
 * @author zy
 * 对成功案例的增删改查
 */
import com.shengjia.commons.Page;

public class MainDao {
	Connection conn; // 数据库对象
	Statement stmt; // 数据库语句对象
	ResultSet rs; // 查询结果集对象
	String sql = null; // 查询语句字符串

	// 构造函数初始化数据库连接
	public MainDao() {
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
	 * 增加成功案例
	 * 
	 * @param casename
	 * @param description
	 * @param date
	 * @param img1
	 * @return
	 */
	public boolean addCase(String category, String detail, String date, String content) {
		boolean flag = false;
		// 找到最后一个id号
		String sql1 = "select* from main";
		try {
			int id = 1;
			rs = stmt.executeQuery(sql1);
			if (rs.next()) {
				rs.last(); // 最后一行
				id = rs.getInt(1) + 1;
			}
			String sql = "insert into main " + "(id,category,detail,date,content) values ('" + id + "','" + category
					+ "','" + detail + "','" + date + "','" + content + "');";
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
	 * 删除成功案例
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean removeCase(int id) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "main" + " where id=" + id;
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

	public ArrayList<String> getCategorys() {
		String sql = "SELECT DISTINCT category FROM main ;";
		ArrayList<String> sA = new ArrayList<String>();
		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				sA.add(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println("查询类别失败了");
		}
		return sA;
	}

	/**
	 * 修改
	 * 
	 * @param id
	 * @param casename
	 * @param description
	 * @param date
	 * @return
	 */

	public boolean updateCase(int id, String category, String detail, String date, String content) {
		boolean flag = false;
		sql = "update main set category='" + category + "',detail='" + detail + "',date='" + date + "',content='"
				+ content + "'where id='" + id + "'";
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
	public Main queryCaseById(int id) {
		Main sCase = new Main();
		sql = "select * from main where id='" + id + "'";
		try {
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				sCase.setId(rs.getInt("id"));
				sCase.setCategory(rs.getString(2));
				sCase.setDetail(rs.getString(3));
				sCase.setDate(rs.getString(4));
				sCase.setContent(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sCase;
	}

	/* 根据category查询 */
	public ArrayList<Main> queryCaseByCategory(String category) {
		ArrayList<Main> mains = new ArrayList<Main>();
		sql = "select * from main where category='" + category + "'";
		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Main sCase = new Main();
				sCase.setId(rs.getInt("id"));
				sCase.setCategory(rs.getString(2));
				sCase.setDetail(rs.getString(3));
				sCase.setDate(rs.getString(4));
				sCase.setContent(rs.getString(5));
				mains.add(sCase);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mains;
	}

	/**
	 * 查看所有成功
	 * 
	 * @return
	 */
	public ArrayList<Main> queryAllCase() {
		sql = "select id from main";
		ArrayList<Integer> id1 = new ArrayList<Integer>();
		int id = 0;
		ArrayList<Main> allcase = new ArrayList<Main>();
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
			Main sCase = queryCaseById(id1.get(i));
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
		List<Main> list = queryAllCase();
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
		ArrayList<Main> records = findPageRecords(page.getStartIndex(), page.getPageSize());
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
	private ArrayList<Main> findPageRecords(int startIndex, int pageSize) {
		sql = "select * from main limit" + " " + startIndex + "," + pageSize;
		System.out.println("+++++");
		System.out.println(sql);
		System.out.println("++++++");
		ArrayList<Main> sc = new ArrayList<Main>();
		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Main sCase = new Main();
				sCase.setId(rs.getInt("id"));
				sCase.setCategory(rs.getString(2));
				sCase.setDetail(rs.getString(3));
				sCase.setDate(rs.getString(4));
				sCase.setContent(rs.getString(5));
				sc.add(sCase);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sc;
	}
	// --------------------------------------------

	/**
	 * 根据用户查看的页码，查询封装分页信息的page对象
	 * 
	 * @param num
	 *            如果为null或者"",默认值为1
	 * @return
	 */
	public Page findpPage(String num, int pageSize, ArrayList<Main> totalRecords) {
		int pageNum = 1;
		if (num != null && !"".equals(num)) {
			pageNum = Integer.parseInt(num);
		}
		Page page = new Page(pageNum, totalRecords.size(), pageSize);

		ArrayList<Main> records = findPageRecords(totalRecords, page.getPageSize(), pageNum);
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
	private ArrayList<Main> findPageRecords(ArrayList<Main> totalRecords, int pageSize, int currentpage) {
		int start = (currentpage - 1) * pageSize;
		int end = 0;
		if (currentpage * pageSize >= totalRecords.size()) {
			end = totalRecords.size() - 1;
		} else {
			end = start + pageSize - 1;
		}
		for (int i = 0; i < totalRecords.size(); i++) {
			System.out.println("查询结果" + totalRecords.get(i).getContent());
		}
		System.out.println(start + ":::" + end);
		ArrayList<Main> sc = new ArrayList<Main>();

		for (int i = start; i <= end; i++) {
			sc.add(totalRecords.get(i));
		}
		return sc;
	}
	// --------------------

	public static void main(String[] args) throws Exception {
		/** 测试插入 **/
		System.out.println("-----测试插入------");
		MainDao s = new MainDao();
		Date date1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(date1);
		/* date = java.sql.Date.valueOf(pd); */
		boolean m = s.addCase("14", "是", "萨", "sa");
		System.out.println("是否插入成功?" + m);
		/** 测试删除 **/
		System.out.println("-----测试删除------");
		System.out.println("是否删除成功" + s.removeCase(3));
		/** 测试修改 **/
		System.out.println("-----测试修改------");
		boolean m1 = s.updateCase(1, "8", "4", date, "ada");
		System.out.println("是否修改成功：" + m1);
		System.out.println("-----测试查看------");

		ArrayList<Main> pArrayList = s.queryCaseByCategory("wd");

		for (Main successfulCase : pArrayList) {
			System.out.println(successfulCase.getId() + ":" + successfulCase.getCategory());
		}

		ArrayList<String> p = s.getCategorys();
		for (int i = 0; i < p.size(); i++) {
			System.out.println("ca" + p.get(i));
		}
	}
}
