package com.shengjia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.shengjia.bean.DetailMaterial;
import com.shengjia.commons.Page;

public class DetailMaterialDAO {
	Connection conn; // 数据库对象
	Statement stmt; // 数据库语句对象
	ResultSet rs; // 查询结果集对象
	String sql = null; // 查询语句字符串

	// 构造函数初始化数据库连接
	public DetailMaterialDAO() {
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
	 * 增加
	 */
	public boolean addDetailmaterial(String materialname, String img, String des) {
		boolean flag = false;
		try {
			String sql = "insert into detailmaterial" + "(materialname,img,des) values ('" + materialname + "','" + img
					+ "','" + des + "');";
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
	 * 使用id 删除
	 */
	public boolean removeDetailMaterialById(int id) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "detailmaterial" + " where id='" + id + "'";
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
	 * 删除
	 */
	public boolean removeDetailMaterial(String materialname) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "detailmaterial" + " where materialname='" + materialname + "'";
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

	public boolean updateDetailMaterial(int id, String materialname, String img, String des) {
		boolean flag = false;
		sql = "update detailmaterial set materialname='" + materialname + "',img='" + img + "',des='" + des
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
	public ArrayList<DetailMaterial> queryDetailMaterialByName(String materialname) {
		ArrayList<DetailMaterial> cs = new ArrayList<DetailMaterial>();
		sql = "select * from DetailMaterial where materialname='" + materialname + "'";
		System.out.println("查询：" + sql);

		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				DetailMaterial rem = new DetailMaterial();// 一定要放在里面
				rem.setId(rs.getInt(1));
				rem.setMaterialName(rs.getString(2));
				rem.setImg(rs.getString(3));
				rem.setDes(rs.getString(4));
				cs.add(rem);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cs;
	}

	/**
	 * 根据用户查看的页码，查询封装分页信息的page对象
	 * 
	 * @param num
	 *            如果为null或者"",默认值为1,当前页：num 页面大小:pageSize
	 * @return
	 */
	public Page findpPage(String num, int pageSize, ArrayList<DetailMaterial> totalRecords) {
		int pageNum = 1;
		if (num != null && !"".equals(num)) {
			pageNum = Integer.parseInt(num);
		}
		Page page = new Page(pageNum, totalRecords.size(), pageSize);

		ArrayList<DetailMaterial> records = findPageRecords(totalRecords, page.getPageSize(), pageNum);
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
	private ArrayList<DetailMaterial> findPageRecords(ArrayList<DetailMaterial> totalRecords, int pageSize,
			int currentpage) {
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
		ArrayList<DetailMaterial> sc = new ArrayList<DetailMaterial>();

		for (int i = start; i <= end; i++) {
			sc.add(totalRecords.get(i));
		}
		return sc;
	}

	public static void main(String[] args) {
		DetailMaterialDAO reDbo = new DetailMaterialDAO();
		boolean sd = reDbo.addDetailmaterial("sfaa1", "mn", "ss");
		System.out.println("插入是否成功" + sd);
		boolean sp = reDbo.removeDetailMaterial("sfaa1");
		System.out.println("删除是否成功" + sp);
		boolean m1 = reDbo.updateDetailMaterial(2, "sfaa2", "sd", "3");
		System.out.println("是否修改成功：" + m1);
		ArrayList<DetailMaterial> pCaseImg = reDbo.queryDetailMaterialByName("sfaa2");
		for (int i = 0; i < pCaseImg.size(); i++) {
			System.out.println("在这里查询；" + pCaseImg.get(i).getImg());
		}
		System.out.println("-----测试查看------");
	}

}
