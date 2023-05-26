<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%
    	String voter_id = (String)session.getAttribute("voter_id");
		if(voter_id == null){
  			response.sendRedirect("login.jsp");
  		} 
		String className = pageContext.getServletContext().getInitParameter("class");
		Class.forName(className);
    	String url = pageContext.getServletContext().getInitParameter("url");
    	String username = pageContext.getServletContext().getInitParameter("username");
    	String pass = pageContext.getServletContext().getInitParameter("password");
		Connection con = DriverManager.getConnection(url,username,pass);
		PreparedStatement pst3 = con.prepareStatement("select * from voter where voter_id = ?");
		pst3.setString(1,voter_id);
		ResultSet rs3 = pst3.executeQuery();
		while(rs3.next()){
			if(rs3.getInt("vote")  == 1){
				response.sendRedirect("alreadyVote.jsp");
			}
		}
  	%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contenstant Detail</title>
    <link rel="stylesheet" href="css/contenstant.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Rokkitt:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <script
      type="module"
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
    ></script>
  </head>
  <body>
    <header class="header">
      <div class="container">
        <div class="logo-box">
          <a href="">
            <img
              class="web-logo"
              src="images/website-logo.png"
              alt="SECOND HAND BOOK"
            />
          </a>
        </div>
      </div>
    </header>
    <hr class="horizontal" />

    <section>
      <div class="section-header">
        <h1 class="head">CONTENSTANT</h1>
      </div>
      
      <div class="section-contenstant">
      <div class="contenst-container">
        <table class="table">
        <tr>
            <th>S.NO.</th>
            <th>PARTY SYMBOL</th>
            <th>PARTY NAME</th>
            <th>CANDIDATE NAME</th>
            <th>CANDIDATE SYMBOL</th>
            <th>VOTE</th>  
          </tr>
      <%
      		
      		
			PreparedStatement pst1 = con.prepareStatement("select * from voter where voter_id = ?");
			pst1.setString(1,voter_id);
			ResultSet rs1 = pst1.executeQuery();
			int booth_id = 0;
			while(rs1.next()){
				booth_id = rs1.getInt("booth_id");
			}
			PreparedStatement pst = con.prepareStatement("select * from contenstant left join booth on contenstant.booth_id = booth.booth_id left join party on contenstant.party_id = party.party_id where contenstant.booth_id = ?");
			pst.setInt(1,booth_id);
			ResultSet rs = pst.executeQuery();
			int i=0;
  			while(rs.next()){
  				i++;
      %>
        
          
          <tr>
            <td><%= i %></td>
            <td><img class="img" src="images/<%= rs.getString("party_symbol") %>" alt="" /></td>
            <td><%= rs.getString("party_name") %></td>
            <td><%= rs.getString("c_name") %></td>
            <td><img class="img" src="images/<%= rs.getString("c_image") %>" alt="contenstant-1" /></td>
            <td><a class="danger" href="vote.jsp?c_id=<%= rs.getInt("c_id") %>">VOTE</a></td>
          </tr>
        <%} %>
        </table>
          </div>
          </div>
          
    </section>
    
    <footer class="footer">
      <p>
        &#169; Copyright 2023 voting system | Powered by
        <a class="wp-link" href="contact.jsp">AJAVA team</a>
      </p>
    </footer>
  </body>
</html>
    