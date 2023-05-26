<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String voterid = (String)session.getAttribute("voterid");
	if(voterid == null || voterid.isEmpty()){
		response.sendRedirect("login.jsp");
	}
%>