<%-- 修改医生个人信息。——by liulu --%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>
<% 
 request.setCharacterEncoding("UTF-8"); 
 response.setCharacterEncoding("UTF-8"); 
 response.setContentType("text/html; charset=UTF-8"); 
%> 
<% 
	String newpass=request.getParameter("newPass"); //从表单获得 
	String newpassagain=request.getParameter("newPassAgain");
%>
<html>
<head>
<title>修改用户信息</title>
</head>
<body>
<% 
String user = request.getParameter("userName");
String password=request.getParameter("oldPass");
try{
	/** 连接数据库参数 **/ 
	String driverName = "com.mysql.jdbc.Driver"; //驱动名称 
	String DBUser = "root"; //mysql用户名 
	String DBPasswd = "123456"; //mysql密码 
	String DBName = "ehealth"; //数据库名 
	String connUrl = "jdbc:mysql://101.201.40.158/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd; 
	Class.forName(driverName).newInstance(); 
    Connection con=DriverManager.getConnection(connUrl);
    Statement sql=con.createStatement();
    Statement stmt=con.createStatement();
    ResultSet rs=sql.executeQuery("select *from user where tel='"+ user +"'and pwd='"+password+"'"); 
     //登录信息判断，判断身份，进行主页选择
    if(rs.next()){ 
     if(newpass.equals(newpassagain)){
      boolean hasResultSet = stmt.execute("update user set pwd='"+ newpass +"'where tel='"+user+"'");
     // sql.executeUpdate("update user where pwd='"+ newpass +"'where tel='"+user+"'");  
      if (hasResultSet) {
    	  out.print("<script>alert('对不起，修改失败！');window.location.href='doctorProfile.jsp'</script>");
      }else{
    	  out.print("<script>alert('恭喜修改成功！');window.location.href='login.jsp'</script>");   	  
      }       
     }else{
    	 out.print("<script>alert('新密码两次输入不相同，请重新输入！');window.location.href='doctorProfile.jsp'</script>");
     }
    }
   else{
    // response.sendRedirect("register.html");
     out.print("<script>alert('用户不存在！');window.location.href='doctorProfile.jsp'</script>");
   }
   con.close();
}
catch(SQLException e1){}
%>
</body>
</html>