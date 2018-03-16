package com.shengjia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shengjia.bean.ReMaterial;
import com.shengjia.commons.Page;

public class ReMaterialDBO {
	Connection conn; // 数据库对象
	Statement stmt; // 数据库语句对象
	ResultSet rs; // 查询结果集对象
	String sql = null; // 查询语句字符串

	// 构造函数初始化数据库连接
	public ReMaterialDBO() {
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
	 * 增加推荐材料
	 * 
	 * @param name
	 * @param category
	 * @param details
	 * @param img
	 * @return
	 */
	public boolean addMaterial( String category, String img) {
		boolean flag = false;
		// 找到最后一个id号
		String sql1 = "select* from recommend";
		try {
			int id = 1;
			rs = stmt.executeQuery(sql1);
			if (rs.next()) {
				rs.last(); // 最后一行
				id = rs.getInt(1) + 1;
			}

			String sql = "insert into recommend" + "(id,category,img) values ('" + id + "','" 
			+ category + "','" + img + "');";
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
	 * 删除材料
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean removeMaterial(int id) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "recommend" + " where id=" + id;
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
	 * @param id
	 * @param name
	 * @param category
	 * @param details
	 * @param img
	 * @return
	 */

	public boolean updateMaterial(int id,  String category,  String img) {
		boolean flag = false;
		sql = "update recommend set category='"  + category +  "',img='"
				+ img + "'where id='" + id + "'";
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
	 * 根据id号查看信息
	 * 
	 * @param id
	 * @return
	 */
	public ReMaterial queryMaterialById(int id) {
		ReMaterial rem = new ReMaterial();
		sql = "select * from recommend where id='" + id + "'";
		try {
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				rem.setId(rs.getInt("id"));
				rem.setCategory(rs.getString(2));
				rem.setImg(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rem;
	}
	/**查看所有信息
	 * 
	 * @return
	 */
	public ArrayList<ReMaterial> queryAllMaterials() {
		sql = "select id from recommend";
		ArrayList<Integer> id1 = new ArrayList<Integer>();
		int id = 0;
		ArrayList<ReMaterial> allcase = new ArrayList<ReMaterial>();
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
			ReMaterial rem = queryMaterialById(id1.get(i));
			allcase.add(rem);
		}
		return allcase;
	}
	
	/**
	 * 查询记录条数
	 * @return
	 */
	public int getTotalRecords(){
		List<ReMaterial> list=queryAllMaterials();
		int totalPage=list.size();
		return totalPage;
	}
	/**
	 * 根据用户查看的页码，查询封装分页信息的page对象
	 * @param num 如果为null或者"",默认值为1
	 * @return
	 */
	public Page findpPage(String num,int pageSize){
		int pageNum=1;
		if(num!=null&&!"".equals(num)){
			pageNum=Integer.parseInt(num);
		}
		Page page=new Page(pageNum, getTotalRecords(),pageSize);
		ArrayList<ReMaterial> records=findPageRecords(page.getStartIndex(),page.getPageSize());
		page.setRecord(records);
		return page;
	}
/**
 * 找到某一页的所有record
 * @param startIndex
 * @param pageSize
 * @return
 */
	private ArrayList<ReMaterial> findPageRecords(int startIndex, int pageSize) {
		sql = "select * from recommend limit" +" "+startIndex+","+pageSize;
		System.out.println("+++++");
		System.out.println(sql);
		System.out.println("++++++");
		ArrayList<ReMaterial> sc=new ArrayList<ReMaterial>();
		try {
			 rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ReMaterial sCase = new ReMaterial();
				sCase.setId(rs.getInt("id"));
				sCase.setCategory(rs.getString(2));
				sCase.setImg(rs.getString(3));
				sc.add(sCase);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sc;
	}
	
	
	

	public static void main(String[] args) {
		ReMaterialDBO reDbo = new ReMaterialDBO();
		boolean sd = reDbo.addMaterial("sfaa",  "zc");
		System.out.println("插入是否成功" + sd);
		boolean sp = reDbo.removeMaterial(1);
		System.out.println("删除是否成功" + sp);
		boolean m1 = reDbo.updateMaterial(2, "2", "3");
		System.out.println("是否修改成功：" + m1);
		System.out.println("-----测试查看------");

		ArrayList<ReMaterial> pArrayList = reDbo.queryAllMaterials();

		for (ReMaterial material : pArrayList) {
			System.out.println(material.getId() + ":" + material.getCategory());
		}
	}
}
