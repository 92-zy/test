package com.yc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yc.dao.DBHelper;

/**
 * 
 * @author zy
 * @2020年12月26日
 */
@WebServlet("/resorder.do")
public class ResOrderServlet extends HttpServlet{
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
		if("order".equals(op)) {
			order(req,resp);
		}
	}

	/**
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void order(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//得到输出
		PrintWriter out=resp.getWriter();
		
		String address=req.getParameter("address");
		String tel=req.getParameter("tel");
		String deliverytime=req.getParameter("deliverytime");
		String ps=req.getParameter("ps");
		String uid=req.getParameter("uid");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=sdf.format(new Date());
		
		//sql语句
		String sql="insert into resorder values(null,?,?,?,?,?,?,0)";
		
		int result=db.doUpdate(sql,uid,address,tel,time,time,ps);
		out.print(result);
	}
}
