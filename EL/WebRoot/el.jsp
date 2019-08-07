<%@ page language="java" import="java.util.*,com.hlc.ov.*"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<h3>使用传统方式获取作用域数据</h3>
<%=request.getParameter("uname")%></br>
<%=request.getAttribute("str")%></br>
<%=((User) request.getAttribute("user")).getAdd().getTown()%></br>
<%=((ArrayList) request.getAttribute("list")).get(2)%></br>
<%=((User) ((ArrayList) request.getAttribute("list2")).get(0)).getAdd().getTown()%></br>
<%=((HashMap) request.getAttribute("map")).get("中国")%></br>
<%=((User) ((HashMap) request.getAttribute("map2")).get("person")).getAdd().getTown()%>
<%--
	传统方式获取作用域数据：
			缺点一：需要导入包
			缺点二：需要跳转
			缺点三：获取数据得代码麻烦
	使用EL表达式获取作用域数据
	作用：获取作用域对象中的数据
	注意：获取的是pageContext、request、session、application四个对象中的数据。
	语法：${}
	表达式：
		获取请求数据
			request对象存储的请求数据：
				param.键名    返回值
				parpmvalues.键名  返回数组
		通过setAttribute方法存储到作用域对象中的数据
			如果存储的是普通字符串则直接返回
			如果存储的是对象则返回的是对象
	作用域查找顺序：
		默认查找顺序
		pageContext-->request-->session-->application
		注意：
			每次查找都是从小到大进行查找，找到了则获取，不再继续查找。
		指定查找
			${pageScope.键名 }
			${requestScope.键名 }
			${sessionScope.键名 }
			${applicationScope.键名 }
	EL表达式的逻辑运算
		${逻辑表达式}	&& || ！
		${算术表达式}	+ - * / %
		${关系表达式}	> < == != 等
		注意：+表示加法运算，不表示字符连接，也可以使用三目运算		
	EL的空值判断:
		${empty 键名}
		作用:
			判断键名对象的值是否存有数据。
	EL获取请求头数据和Cookie数据：(了解即可)
		请求头数据：
			${header}-->返回所有的请求头数据
			${header["键名"]}--->返回指定的键名的请求头数据
			${hedaerValues["键名"]}--->返回指定的键名(同键不同值)的值的数组。
		获取Cookie数据：
			${cookie}--->返回存储了所有的cookie对象的map集合
			${cookie.键名}---->返回指定的cookie对象
			${cookie.键名.name}--->返回指定的cookie对象存储的数据的键名。
			${cookie.键名.value}--->返回指定的cookie对象存储的数据的值。
 --%>
<!-- 使用EL表达式获取作用域数据-->
<h3>使用EL表达式获取作用域数据</h3>
${param.uname}
</br>
${str }
</br>
${user.add.town }
</br>
${list[2] }
</br>
${list2[0].add.town }
</br>
${map.中国 }
</br>
${map2.person.add.town }

<h3>EL的作用域查找顺序</h3>
<%
	pageContext.setAttribute("hello", "hellopageContext");
	request.setAttribute("hello", "helloRequest");
	session.setAttribute("hello", "hello session");
	application.setAttribute("hello", "hello application");
%>

${hello }
${pageScope.hello}---${requestScope.hello}--${sessionScope.hello}--${applicationScope.hello}
<h3>EL表达式的逻辑运算</h3>
${1+2}--${1*2}--${4/2}--${4-2}--${4%3}--${4==4}--${4>2}--${sex==1?'男':'女'}--${1+'2'}
<h3>EL表达式的空值判断</h3>
${empty s}--${empty s1}--${empty s2}---${empty s3}
<h3>EL获取请求头数据和Cookie数据</h3>
${header}--${headerValues["accept-language"][0]}
<br />
<br />
<br />
${cookie}--${cookie.JSESSIONID}---${cookie.JSESSIONID.name}--${cookie.JSESSIONID.value}




