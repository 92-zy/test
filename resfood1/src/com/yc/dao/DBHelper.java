package com.yc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBHelper {
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	public Connection getConnection(){
		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/res","root","mysql");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	
	
	public int doUpdate(String sql,Object... params){
		Connection con=getConnection();
		int result=-1;
		try {
			PreparedStatement pstmt=con.prepareStatement(sql);
			doParams(pstmt,params);
			result=pstmt.executeUpdate();
			closeAll(null,con,pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;		
	}

	private void doParams(PreparedStatement pstmt, Object... params) {
		if(  params!=null  &&   params.length>0  ){
			for(  int i=0;i<params.length;i++ ){
				try {
					pstmt.setObject(i+1, params[i]);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public List<Map<String,String>> findAll(String sql,Object... params){
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		try {
			Connection con=getConnection();
			PreparedStatement pstmt=con.prepareStatement(sql);
			doParams(pstmt,params);
			ResultSet rs=pstmt.executeQuery();
			ResultSetMetaData rsmd=rs.getMetaData();
			String[] columnNames=new String[  rsmd.getColumnCount()  ];
			for(int i=0;i<columnNames.length;i++){
				columnNames[i]=rsmd.getColumnName(i+1).toLowerCase();
			}
			while(  rs.next()  ){
				Map<String,String> map=new HashMap<String,String>();
				for(   String cn :  columnNames ){			
					String value=rs.getString(cn);		
					map.put(cn, value);
				}
				list.add(map);
			}
			closeAll(rs, con, pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void closeAll(ResultSet rs,Connection con,PreparedStatement ps){
		try {
			if(  rs!=null  ){
				rs.close();
			}
			if(  con!=null ){
				con.close();
			}
			if(  ps!=null ){
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
