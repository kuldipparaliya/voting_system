<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="header.jsp" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Party page</title>
    <link rel="stylesheet" href="css/style.css" />
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
              src="../images/website-logo.png"
              alt="SECOND HAND BOOK"
            />
          </a>
        </div>
      </div>
    </header>
    <hr class="horizontal" />

    <nav class="nav">
      <ul class="navigation">
        <li class="nav-li"><a class="nav-link" href="boothList.jsp">BOOTH_LIST</a></li>
         <li class="nav-li"><a class="nav-link" href="candidateList.jsp">CANDIDATE_LIST</a></li>
         <li class="nav-li"><a class="nav-link" href="voterList.jsp">VOTER_LIST</a></li>
         <li class="nav-li"><a class="nav-link" href="votingDetail.jsp">RESULT</a></li>
        <li class="nav-li"><a class="nav-link" href="../logout.jsp">LOGOUT</a></li>
      </ul>
    </nav>
    <hr class="horizontal" />
	
    <section>
      <div class="section">
        <div class="container-header">
          <h1 class="head">Party-list</h1>
          <a class="addbutton" href="addParty.jsp">ADD PARTY</a>
        </div>
        <%
        String className = pageContext.getServletContext().getInitParameter("class");
		Class.forName(className);
    	String url = pageContext.getServletContext().getInitParameter("url");
    	String username = pageContext.getServletContext().getInitParameter("username");
    	String pass = pageContext.getServletContext().getInitParameter("password");
		Connection con = DriverManager.getConnection(url,username,pass);
		PreparedStatement pst = con.prepareStatement("select * from party");
		ResultSet rs = pst.executeQuery();
		%>

        <table class="table">
          <tr>
            <th>S.NO.</th>
            <th>PARTY ID</th>
            <th>PARTY SYMBOL</th>
            <th>PARTY NAME</th>
            <th>VIEW CANDIDATE</th>
            <th>UPDATE PARTY</th>
            <th>DELETE PARTY</th>
          </tr>
          <%
          int i = 0;
          	while(rs.next()){
          		i++;
          %>
          <tr>
            <td><%= i %></td>
            <td><%= rs.getInt("party_id") %></td>
            <td><img class="book-img" src="../images/<%= rs.getString("party_symbol") %>" alt="" /></td>
            <td><a class="name" href="candidate.jsp?party_name=<%= rs.getString("party_name") %>"><%= rs.getString("party_name") %></a></td>
            <td>
              <a href="candidate.jsp?party_name=<%= rs.getString("party_name") %>"><ion-icon name="eye-outline"></ion-icon></a>
            </td>
            <td>
              <a href="updateParty.jsp?party_name=<%= rs.getString("party_name") %>"><ion-icon name="create-outline"></ion-icon></a>
            </td>
            <td>
              <a href="deleteParty.jsp?party_id=<%= rs.getInt("party_id") %>"><ion-icon name="trash-outline"></ion-icon></a>
            </td>
          </tr>
          <%} if(i==0){%>
      	 <h1 class="error">No Candidate Added!!</h1>
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
