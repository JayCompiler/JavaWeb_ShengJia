package com.shengjia.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.shengjia.bean.Message;
import com.shengjia.commons.Page;
public class MessageDBO {
	Connection conn; // 数据库对象
	Statement stmt; // 数据库语句对象
	ResultSet rs; // 查询结果集对象
	String sql = null; // 查询语句字符串

	// 构造函数初始化数据库连接
	public MessageDBO() {
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
	 * 插入信息
	 * @param name
	 * @param telephone
	 * @param message
	 * @return
	 */
	public boolean addMessage(String name, String telephone, String message ) {
		boolean flag = false;
		Date date1 =new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date=sdf.format(date1);
		
		// 找到最后一个id号
		String sql1 = "select* from message";
		try {
			int id = 1;
			rs = stmt.executeQuery(sql1);
			if (rs.next()) {
				rs.last(); // 最后一行
				id = rs.getInt(1) + 1;
			}

			String sql = "insert into message" + "(id,name,telephone,message,date) values ('" + id + "','" + name
					+ "','" + telephone + "','" + message + "','"+date+"');";
			int count = stmt.executeUpdate(sql);
			System.out.println(sql);
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
	public boolean removeMessage(int id) {
		boolean flag = false;
		int ret = 0;
		String sql = "delete from " + "message" + " where id=" + id;
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
	 * 根据id号获得信息
	 * 
	 * @param id
	 * @return
	 */
	public Message queryMessageById(int id) {
		Message mes = new Message();
		sql = "select * from message where id='" + id + "'";
		try {
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				mes.setId(rs.getInt("id"));
				mes.setName(rs.getString(2));
				mes.setTelephone(rs.getString(3));
				mes.setMessage(rs.getString(4));
				mes.setDate(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mes;
	}

	public ArrayList<Message> queryAllMessage() {
		sql = "select id from message";
		ArrayList<Integer> id1 = new ArrayList<Integer>();
		int id = 0;
		ArrayList<Message> allcase = new ArrayList<Message>();
		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				id = rs.getInt(1);
				id1.add(id);
			/*	Message rem=queryMessageById(id);
				allcase.add(rem);*/
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int i = 0; i < id1.size(); i++) {
			Message rem = queryMessageById(id1.get(i));
			allcase.add(rem);
		}
		return allcase;
	}
	
	/**
	 * 查询记录条数
	 * @return
	 */
	public int getTotalRecords(){
		List<Message> list=queryAllMessage();
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
		ArrayList<Message> records=findPageRecords(page.getStartIndex(),page.getPageSize());
		page.setRecord(records);
		return page;
	}
/**
 * 找到某一页的所有record
 * @param startIndex
 * @param pageSize
 * @return
 */
	private ArrayList<Message> findPageRecords(int startIndex, int pageSize) {
		sql = "select * from message limit" +" "+startIndex+","+pageSize;
		System.out.println("+++++");
		System.out.println(sql);
		System.out.println("++++++");
		ArrayList<Message> sc=new ArrayList<Message>();
		try {
			 rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Message mes = new Message();
				mes.setId(rs.getInt("id"));
				mes.setName(rs.getString(2));
				mes.setTelephone(rs.getString(3));
				mes.setMessage(rs.getString(4));
				mes.setDate(rs.getString(5));
				sc.add(mes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sc;
	}
	
	
	
	

	public static void main(String[] args) {
			MessageDBO msDbo=new MessageDBO();
			msDbo.addMessage("王五", "172728181", "你哈");
			ArrayList<Message> messages=msDbo.queryAllMessage();
			for (Message message : messages) {
				System.out.println(message.getId()+":"+message.getDate());
			}
	}

}
