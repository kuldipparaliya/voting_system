<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"  %>
    <%
    	String voter_id = (String)session.getAttribute("voter_id");
    	if(voter_id == null){
    		response.sendRedirect("login.jsp");
    	}
    %>
    <%
    String className = pageContext.getServletContext().getInitParameter("class");
	Class.forName(className);
	String url = pageContext.getServletContext().getInitParameter("url");
	String username = pageContext.getServletContext().getInitParameter("username");
	String pass = pageContext.getServletContext().getInitParameter("password");
	Connection con = DriverManager.getConnection(url,username,pass);
	PreparedStatement pst1 = con.prepareStatement("select * from voter where voter_id = ?");
	pst1.setString(1,voter_id);
	ResultSet rs1 = pst1.executeQuery();
	while(rs1.next()){
		if(rs1.getInt("vote") == 1){
			response.sendRedirect("alreadyVote.jsp");
		}
	}
	
    %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Voter Detail</title>
    <link rel="stylesheet" href="css/voterDetail.css"/>
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
        <div class="search-box">
          <input class="search" type="text" placeholder="search" />
          <button class="btn">
            <ion-icon class="icon" name="search-outline"></ion-icon>
          </button>
        </div>
      </div>
    </header>
    <hr class="horizontal" />

    <nav class="nav">
      <ul class="navigation">
        <li class="nav-li"><a class="nav-link" href="contenstant.jsp">GIVE VOTE</a></li>
        <li class="nav-li"><a class="nav-link" href="logout.jsp">LOGOUT</a></li>
      </ul>
    </nav>
     <% 
    	
		PreparedStatement pst = con.prepareStatement("select * from voter left join booth on voter.booth_id = booth.booth_id where voter_id = ?");
		pst.setString(1,voter_id);
		ResultSet rs = pst.executeQuery();
    	while(rs.next()){
    %>

    <section>
      <div class="section">
        <div class="background"></div>
        <div class="img-box">
          <img class="profile-img" src="images/author-1.jpg" alt="profile picture" />
          <h2 class="name"><%= rs.getString("voter_name") %></h2>
        </div>
        <div class="detail-container">
          <p class="age">Age: <%= rs.getInt("age") %></p>
          <p class="area">Area-no: <%= rs.getInt("booth_id") %> </p>
          <p class="location">Location: <%=rs.getString("booth_name") %></p>
        </div>
 <%} %>
        <div class="vote-box">
          <a href="contenstant.jsp" class="vote">GIVE VOTE &rarr;</a>
        </div>
      </div>
    </section>
    
    <hr class="horizontal" />

    <footer class="footer">
      <p>
        &#169; Copyright 2023 voting system | Powered by
        <a class="wp-link" href="contact.jsp">AJAVA team</a>
      </p>
    </footer>
 

</body>
</html>