package com.yc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yc.dao.DBHelper;

/**
 * @author zy
 * @2020年12月24日
 */
@WebServlet("/resuser.do")
public class ResUserServlet extends HttpServlet{
	private static final long serialVersionUID = 3089745960350670627L;
	private DBHelper db=new DBHelper();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		
		String op=req.getParameter("op");
		
		//根据参数
		if("login".equals(op)) {
			login(req,resp);
		}
	}

	/**
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//得到输出
		PrintWriter out=resp.getWriter();
		
		String uname=req.getParameter("uname");
		String pwd=req.getParameter("pwd");
		
		//开始查询数据库
		String sql="select * from resuser where username=? and pwd=?";
		List<Map<String,String>> list=db.findAll(sql,uname,pwd);
		Gson gson=new Gson();
		String json = gson.toJson(list);
		//输出数据
		out.println(json );
		
	}

}
