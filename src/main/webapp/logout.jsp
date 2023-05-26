<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	
    	String page1 ="";
    	String voter_id = (String)session.getAttribute("voter_id");
    	if(voter_id == null){
    		page1 = "login.jsp";
    		
    	}
    	//session.removeAttribute("voterid");
    	session.invalidate();
    	page1="login.jsp";
    	response.sendRedirect(page1);
    %>
