<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%
	int booth_id = Integer.parseInt(request.getParameter("booth_id"));
	try {
		String className = pageContext.getServletContext().getInitParameter("class");
		Class.forName(className);
    	String url = pageContext.getServletContext().getInitParameter("url");
    	String username = pageContext.getServletContext().getInitParameter("username");
    	String pass = pageContext.getServletContext().getInitParameter("password");
		Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("delete from booth where booth_id = ?");
			pst.setInt(1,booth_id);
			pst.executeUpdate();
			PreparedStatement pst1 = con.prepareStatement("delete from contenstant where booth_id = ?");
			pst1.setInt(1,booth_id);
			pst1.executeUpdate();
	
			response.sendRedirect("boothList.jsp");
	
		}catch(Exception e) {

			e.printStackTrace();
		}
%>