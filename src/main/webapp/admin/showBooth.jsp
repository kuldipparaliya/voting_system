<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Booth Page</title>
<title>Candidate page</title>
    <link rel="stylesheet" href="css/showBooth.css" />
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
      	<li class="nav-li"><a class="nav-link" href="index.jsp">PARTY_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="">BOOTH_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="voterList.jsp">VOTER_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="candidateList.jsp">CANDIDATE_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="../logout.jsp">LOGOUT</a></li>
      </ul>
    </nav>
    <hr class="horizontal" />
    
    <section>
      <div class="section-container">
        <div class="container-header">
          <h1 class="head">Select Party of Candidate</h1>
        </div>
        <div class="form-container">
          <form action="addCandidate.jsp" name="add-party" method="post" >
            <div class="candidate-party">
              <div class="party-list">
                <label for="party-title">Party</label>
                <select name="candidate-party">
                <%
                String className = pageContext.getServletContext().getInitParameter("class");
        		Class.forName(className);
            	String url = pageContext.getServletContext().getInitParameter("url");
            	String username = pageContext.getServletContext().getInitParameter("username");
            	String pass = pageContext.getServletContext().getInitParameter("password");
        		Connection con = DriverManager.getConnection(url,username,pass);
          		PreparedStatement pst = con.prepareStatement("select * from party");
          		ResultSet rs = pst.executeQuery();
          		while(rs.next()){%>
          			<option value=<%=rs.getString("party_id") %> name=""><%= rs.getString("party_name") %></option>
          		<%} %>
          		</select>
              </div>   
              <div class="party-save">
                <input type="submit" class="save" value="Next" name="save" />
              </div>
            </div>
          </form>
        </div>
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