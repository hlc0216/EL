package com.hlc.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import com.hlc.ov.Address;
import com.hlc.ov.User;

public class elServlet extends HttpServlet {
@Override
public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
//设置编码格式
	res.setCharacterEncoding("utf-8");
	res.setContentType("text/html;charset=utf-8");
	req.setCharacterEncoding("utf-8");
	//获取请求信息
	String uname=req.getParameter("uname");
	String pwd=req.getParameter("pwd");
	//处理请求信息
	System.out.println("name="+uname+"pwd="+pwd);
	//响应处理结果
		//使用request作用域进行数据流转
		req.setAttribute("str", "今天的天使很美");
		//对象类型
		User u = new User("libai","123",new Address("北京","海淀区","七里胡同"));
		req.setAttribute("user", u);
		//集合类型
			//List类型
		  		//存储普通字符
		List<String>list=new ArrayList<String>();
		list.add("百里守约");
		list.add("李白");
		list.add("雅典娜");
		req.setAttribute("list", list);
				//存储对象
		List<User>list2=new ArrayList<User>();
		User u1=new User("鲁班", "123", new Address("陕西","西安","长安街"));
		list2.add(u1);
		req.setAttribute("list2", list2);
		
			//map类型
				//存储普通字符
		Map<String, String>map=new HashMap<String, String>();
		map.put("中国", "北京");
		map.put("日本","东京");
		map.put("美国","华盛顿");
		req.setAttribute("map", map);
				//存储对象
		Map<String,User>map2=new HashMap<String, User>();
		map2.put("person", new User("小齐","123",new Address("湖南","长沙","岳麓书院")));
		req.setAttribute("map2", map2);
		req.getRequestDispatcher("/el.jsp").forward(req, res);
	return ;
}
}
