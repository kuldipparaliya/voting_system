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
    <link rel="stylesheet" href="css/vote_party.css" />
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
    <%String party_name = (String)request.getParameter("party_name"); %>
    <hr class="horizontal" />
    <section>
      <div class="section">
        <div class="container-header">
          <h1 class="head">Party :<%= party_name %></h1>
        </div>

        <table class="table">
          <tr>
            <th>S.NO.</th>
            <th>CANDIDATE ID</th>
            <th>CANDIDATE NAME</th>
            <th>BOOTH NAME</th>
            <th>TOTAL VOTE</th>
          </tr>
          <%
          String className = pageContext.getServletContext().getInitParameter("class");
			Class.forName(className);
      	String url = pageContext.getServletContext().getInitParameter("url");
      	String username = pageContext.getServletContext().getInitParameter("username");
      	String pass = pageContext.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("select * from party left join contenstant on contenstant.party_id = party.party_id left join booth on contenstant.booth_id = booth.booth_id where party_name = ?");
			pst.setString(1,party_name);
			ResultSet rs = pst.executeQuery();
			int i= 0;
			while(rs.next()){
				
				PreparedStatement pst1 = con.prepareStatement("select count(c_id) as total_vote from vote where c_id = ? group by c_id");
				pst1.setInt(1,rs.getInt("c_id"));
				ResultSet rs1 = pst1.executeQuery();
				while(rs1.next()){
					i++;
				
				%>
          <tr>
            <td><%= i %></td>
            <td><%= rs.getInt("c_id") %></td>
            <td><a href="total_candidate_vote.jsp?c_name=<%= rs.getString("c_name") %>"><%= rs.getString("c_name") %></a></td>
            <td><a href="total_vote.jsp?booth_name=<%= rs.getString("booth_name") %>"><%= rs.getString("booth_name") %></a></td>
            <td><a href="total_candidate_vote.jsp?c_name=<%= rs.getString("c_name") %>"><%= rs1.getInt("total_vote") %></a></td>
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
