<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%
	int party_id = Integer.parseInt(request.getParameter("party_id"));
try {
	String className = pageContext.getServletContext().getInitParameter("class");
	Class.forName(className);
	String url = pageContext.getServletContext().getInitParameter("url");
	String username = pageContext.getServletContext().getInitParameter("username");
	String pass = pageContext.getServletContext().getInitParameter("password");
	Connection con = DriverManager.getConnection(url,username,pass);
	PreparedStatement pst = con.prepareStatement("delete from party where party_id = ?");
	pst.setInt(1,party_id);
	pst.executeUpdate();
	PreparedStatement pst1 = con.prepareStatement("delete from contenstant where party_id = ?");
	pst1.setInt(1,party_id);
	pst1.executeUpdate();
	
	response.sendRedirect("index.jsp");
	
}catch(Exception e) {
	
	e.printStackTrace();
}
%>