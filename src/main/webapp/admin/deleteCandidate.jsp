<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%
	int c_id = Integer.parseInt(request.getParameter("c_id"));
try {
	String className = pageContext.getServletContext().getInitParameter("class");
	Class.forName(className);
	String url = pageContext.getServletContext().getInitParameter("url");
	String username = pageContext.getServletContext().getInitParameter("username");
	String pass = pageContext.getServletContext().getInitParameter("password");
	Connection con = DriverManager.getConnection(url,username,pass);
	PreparedStatement pst = con.prepareStatement("delete from contenstant where c_id = ?");
	pst.setInt(1,c_id);
	pst.executeUpdate();
	response.sendRedirect("candidateList.jsp");
	
}catch(Exception e) {
	
	e.printStackTrace();
}
%>