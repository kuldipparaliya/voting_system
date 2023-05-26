<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Voting Detail</title>
    <link rel="stylesheet" href="css/total_candidate_vote.css" />
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
            <img class="web-logo" src="../images/website-logo.png" alt="VOTING SYSTEM" />
          </a>
        </div>
      </div>
    </header>
    <hr class="horizontal" />

    <nav class="nav">
      <ul class="navigation">
        <li class="nav-li"><a class="nav-link" href="index.jsp">PARTY_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="boothList.jsp">BOOTH_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="voterList.jsp">VOTER_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="candidateList.jsp">CANDIDATE_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="../logout.jsp">LOGOUT</a></li>
      </ul>
    </nav>
    <%String candidate_name = (String)request.getParameter("c_name"); %>
    <hr class="horizontal" />
    <section>
      <div class="section">
        <div class="container-header">
          <h1 class="head">Party :<%= candidate_name %></h1>
        </div>

        <table class="table">
          <tr>
            <th>S.NO.</th>
            <th>VOTER ID</th>
            <th>VOTER NAME</th>
            <th>DATE</th>
            
          </tr>
          <%
          String className = pageContext.getServletContext().getInitParameter("class");
			Class.forName(className);
      	String url = pageContext.getServletContext().getInitParameter("url");
      	String username = pageContext.getServletContext().getInitParameter("username");
      	String pass = pageContext.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("select * from contenstant where c_name = ?");
			pst.setString(1,candidate_name);
			ResultSet rs = pst.executeQuery();
			int i= 0;
			while(rs.next()){
				
				PreparedStatement pst1 = con.prepareStatement("select * from vote left join voter on vote.voter_id = voter.voter_id where c_id = ?");
				pst1.setInt(1,rs.getInt("c_id"));
				ResultSet rs1 = pst1.executeQuery();
				while(rs1.next()){
					i++;
				
				%>
          <tr>
            <td><%= i %></td>
            <td><%= rs1.getString("voter_id") %></td>
            <td><%= rs1.getString("voter_name") %></td>
            <%
            Timestamp tr = rs1.getTimestamp("date");
            java.util.Date date = tr;
            %>
            <td><%= date %></td>
          </tr>
        <%}} %>
        </table>
      </div>
    </section>
    <footer class="footer">
      <p>
        &#169; Copyright 2023 voting system | Powered by
        <a class="wp-link" href="">AJAVA team</a>
      </p>
    </footer>
  </body>
</html>
