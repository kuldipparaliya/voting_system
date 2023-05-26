<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vote page</title>
    <link rel="stylesheet" href="css/vote.css" />
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
  <%
  	
  	int c_id = Integer.parseInt(request.getParameter("c_id"));
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
	
	PreparedStatement pst3 = con.prepareStatement("select * from vote where voter_id = ?");
	pst3.setString(1,voter_id);
	ResultSet rs3 = pst3.executeQuery();
	if(!rs3.next()){
			PreparedStatement pst1 = con.prepareStatement("insert into vote(voter_id,c_id,date) values(?,?,CURRENT_TIMESTAMP)");
			pst1.setString(1,voter_id);
			pst1.setInt(2,c_id);
			pst1.executeUpdate();
			
			PreparedStatement pst2 = con.prepareStatement("update voter set vote = 1 where voter_id = ?");
			pst2.setString(1,voter_id);
			pst2.executeUpdate();
		
	}else{
		response.sendRedirect("alreadyVote.jsp");
	}
	PreparedStatement pst = con.prepareStatement("select * from contenstant left join party on contenstant.party_id = party.party_id where c_id = ?");
	pst.setInt(1,c_id);
	
	ResultSet rs = pst.executeQuery();
	while(rs.next()){
  %>
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

    <nav class="nav">
      <ul class="navigation">
        <li class="nav-li"><a class="nav-link" href="home.jsp">HOME</a></li>
        <li class="nav-li"><a class="nav-link" href="logout.jsp">LOGOUT</a></li>
      </ul>
    </nav>
    <hr class="horizontal" />

    <section>
      <div class="thank-msg">
        <h1 class="head">Thank you for vote</h1>
        <h2 class="title">Your vote::</h2>
      </div>
      <div class="contenst-container">
        <div class="contenst">
          <div class="img-box">
            <img class="img" src="images/<%= rs.getString("c_image") %>" alt="contenstant-1" />
            <h3 class="cname"><%= rs.getString("c_name") %></h3>
          </div>
          <div class="party-box">
            <img class="img" src="images/<%= rs.getString("party_symbol") %>" alt="" />
            <h3 class="party"><%= rs.getString("party_name") %></h3>
          </div>
        </div>
      </div>
    </section>
   	<div class="center">
   		<a href="home.jsp" class ="button">More Detail &rarr;</a>
   	</div>    
<% } %>
    <footer class="footer">
      <p>
        &#169; Copyright 2023 voting system | Powered by
        <a class="wp-link" href="contact.jsp">AJAVA team</a>
      </p>
    </footer>
  </body>
</html>
