<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Voter List page</title>
    <link rel="stylesheet" href="css/voterList.css" />
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
        <li class="nav-li"><a class="nav-link" href="candidateList.jsp">CANDIDATE_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="../logout.jsp">LOGOUT</a></li>
      </ul>
    </nav>
    <hr class="horizontal" />
    <section>
      <div class="section">
        <div class="container-header">
          <h1 class="head">Voter List</h1>
          <a class="addbutton" href="addVoter.jsp">ADD Voter</a>
        </div>

        <table class="table">
          <tr>
            <th>S.NO.</th>
            <th>VOTER_ID</th>
            <th>VOTER IMAGE</th>
            <th>VOTER NAME</th>
            <th>VOTER AGE</th>
            <th>BOOTH NAME</th>
            <th>VOTE</th>
            
            <th>UPDATE VOTER</th>
            <th>DELETE VOTER</th>
            
          </tr>
          <%
          String className = pageContext.getServletContext().getInitParameter("class");
			Class.forName(className);
      	String url = pageContext.getServletContext().getInitParameter("url");
      	String username = pageContext.getServletContext().getInitParameter("username");
      	String pass = pageContext.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("select * from voter left join booth on voter.booth_id = booth.booth_id order by voter_id");
			ResultSet rs = pst.executeQuery();
			int i= 0;
			while(rs.next()){
				i++;
			
		%>
          <tr>
            <td><%= i %></td>
            <td><%= rs.getString("voter_id") %></td>
            <td><img class="voter-img" src="../images/<%= rs.getString("voter_img") %>" alt="" /></td>
            <td><%= rs.getString("voter_name") %></td>
            
            <td><%= rs.getInt("age") %></td>
            <td><%= rs.getString("booth_name") %></td>
            <%
            	int vote = rs.getInt("vote");
            	if(vote == 0){%>
            		<td><ion-icon name="close-outline"></ion-icon></td>
            	<%}else{ %>
            	<td><ion-icon name="checkmark-done-outline"></ion-icon></td>
            	
            	<%} %>
            
            <td>
              <a href="updateVoter.jsp?v_no=<%= rs.getInt("v_no") %>"><ion-icon name="create-outline"></ion-icon></a>
            </td>
            <td>
              <a href="deleteVoter.jsp?v_no=<%= rs.getInt("v_no") %>"><ion-icon name="trash-outline"></ion-icon></a>
            </td>
          </tr>
        <%} if(i==0){%>
             	 <h1 class="error">No Voter Detail AVAILABLE!!</h1>
                 <% }%>
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
