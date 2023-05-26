<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%
	int v_no = Integer.parseInt(request.getParameter("v_no"));
try {
	String className = pageContext.getServletContext().getInitParameter("class");
	Class.forName(className);
	String url = pageContext.getServletContext().getInitParameter("url");
	String username = pageContext.getServletContext().getInitParameter("username");
	String pass = pageContext.getServletContext().getInitParameter("password");
	Connection con = DriverManager.getConnection(url,username,pass);
	PreparedStatement pst = con.prepareStatement("delete from voter where v_no = ?");
	pst.setInt(1,v_no);
	pst.executeUpdate();
	response.sendRedirect("voterList.jsp");
	
}catch(Exception e) {
	
	e.printStackTrace();
}
%>