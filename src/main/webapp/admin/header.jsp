<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   	String voter_id = (String)session.getAttribute("voterid");
   	if(voter_id == null || voter_id.isEmpty()){
	   response.sendRedirect("../login.jsp");
   	}
%>