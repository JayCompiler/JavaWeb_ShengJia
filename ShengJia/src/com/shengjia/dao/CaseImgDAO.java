package com.shengjia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.shengjia.bean.CaseImg;
import com.shengjia.commons.Page;

public class CaseImgDAO {
	Connection conn; // 数据库对象
	Statement stmt; // 数据库语句对象
	ResultSet rs; // 查询结果集对象
	String sql = null; // 查询语句字符串

	// 构造函数初始化数据库连接
	public CaseImgDAO() {
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
	 * 增加CaseImg
	 */
	public boolean addCaseImg(String casename, String img, String detail) {
		boolean flag = false;
		try {
			String sql = "insert into caseimg" + "(casename,img,detail) values ('" + casename + "','" + img + "','"
					+ detail + "');";
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
	 * 删除CaseImg
	 */
	public boolean removeCaseImg(int id) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "CaseImg" + " where id='" + id + "'";
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
	 * 删除CaseImg,通过名称
	 */
	public boolean removeCaseImgbyName(String casename) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "CaseImg" + " where casename='" + casename + "'";
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

	public boolean updateCaseImg(String casename, String img, String detail, int id) {
		boolean flag = false;
		sql = "update CaseImg set casename='" + casename + "',img='" + img + "',detail='" + detail + "' where id='" + id
				+ "'";
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
	 * 根据casename号查看CaseImg
	 * 
	 */
	public ArrayList<CaseImg> queryCaseByName(String casename) {
		ArrayList<CaseImg> cs = new ArrayList<CaseImg>();
		sql = "select * from CaseImg where casename='" + casename + "'";
		System.out.println("查询：" + sql);

		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CaseImg rem = new CaseImg();// 一定要放在里面
				rem.setCasename(rs.getString(1));
				rem.setImg(rs.getString(2));
				rem.setId(rs.getInt(3));
				rem.setDetail(rs.getString(4));
				System.out.println("在这里，别跑了" + rem.getImg());
				cs.add(rem);
				System.out.println(cs.get(0).getImg());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		for (int i = 0; i < cs.size(); i++) {
			System.out.println("在这里查询；" + cs.get(i).getImg());
		}
		return cs;
	}

	public boolean isEmpty(String casename) {
		sql = "select * from CaseImg where casename='" + casename + "'";
		System.out.println(sql);
		boolean flag = true;
		try {
			rs = stmt.executeQuery(sql);
			if (!rs.next()) {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 根据用户查看的页码，查询封装分页信息的page对象
	 * 
	 * @param num
	 *            如果为null或者"",默认值为1,当前页：num 页面大小:pageSize
	 * @return
	 */
	public Page findpPage(String num, int pageSize, ArrayList<CaseImg> totalRecords) {
		int pageNum = 1;
		if (num != null && !"".equals(num)) {
			pageNum = Integer.parseInt(num);
		}
		Page page = new Page(pageNum, totalRecords.size(), pageSize);

		ArrayList<CaseImg> records = findPageRecords(totalRecords, page.getPageSize(), pageNum);
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
	private ArrayList<CaseImg> findPageRecords(ArrayList<CaseImg> totalRecords, int pageSize, int currentpage) {
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
		ArrayList<CaseImg> sc = new ArrayList<CaseImg>();

		for (int i = start; i <= end; i++) {
			sc.add(totalRecords.get(i));
		}
		return sc;
	}

	public static void main(String[] args) {
		CaseImgDAO reDbo = new CaseImgDAO();
		boolean sd = reDbo.addCaseImg("sfaa", "zc", "sda");
		System.out.println("插入是否成功" + sd);
		/*
		 * boolean sp = reDbo.removeCaseImg(2); System.out.println("删除是否成功" +
		 * sp); boolean m1 = reDbo.updateCaseImg("67", "3", "sd", 2);
		 * System.out.println("是否修改成功：" + m1); ArrayList<CaseImg> pCaseImg =
		 * reDbo.queryCaseByName("案例2");
		 * 
		 * System.out.println("查询结果" + pCaseImg.get(0).getImg());
		 * System.out.println("查询结果" + pCaseImg.get(2).getImg()); boolean b =
		 * reDbo.isEmpty("67"); System.out.println("是否存在" + b);
		 * System.out.println("-----测试查看------");
		 */
	}

}
