<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Party Page</title>
<link rel="stylesheet" href="css/updateParty.css" />
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
        <li class="nav-li"><a class="nav-link" href="boothList.jsp">BOOTH_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="voterList.jsp">VOTER_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="candidateList.jsp">CANDIDATE_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="../logout.jsp">LOGOUT</a></li>
      </ul>
    </nav>
    <hr class="horizontal" />
    <%
    	String party_name = request.getParameter("party_name");
        String className = pageContext.getServletContext().getInitParameter("class");
	Class.forName(className);
	String url = pageContext.getServletContext().getInitParameter("url");
	String username = pageContext.getServletContext().getInitParameter("username");
	String pass = pageContext.getServletContext().getInitParameter("password");
	Connection con = DriverManager.getConnection(url,username,pass);
    	PreparedStatement pst = con.prepareStatement("select * from party where party_name = ?");
    	pst.setString(1,party_name);
    	ResultSet rs = pst.executeQuery();
    	int i =0;
    	while(rs.next()){
    		i++;
    %>
    
    <section>
      <div class="section-container">
        <div class="container-header">
          <h1 class="head">UPDATE PARTY</h1>
        </div>
        <div class="form-container">
          <form action="save_update_party" name="add-party" method="post">
          <input type="hidden" name="party" value="<%= party_name %>"/>
            <div class="party-data">
              <div class="party-title">
                <label for="party-title">Party-title</label>
                <input type="text" id="party-title" value="<%= rs.getString("party_name") %>" name="party_name" required class="title" />
              </div>
              
              <div class="party-image">
                <label for="image">Party-image-name</label>
                <input type="text" id="image" value="<%= rs.getString("party_symbol") %>" name="party_symbol" required class="title" />
              </div>
              <div class="party-save">
                <input type="submit" class="save" value="save" name="save" />
                <input type="reset" class="reset" value="Reset" name="reset" />
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
    <%} if(i==0){%>
             	 <h1 class="error">No Candidate Added!!</h1>
                 <% }%>
	<footer class="footer">
      <p>
        &#169; Copyright 2023 voting system | Powered by
        <a class="wp-link" href="">AJAVA team</a>
      </p>
    </footer>

</body>
</html>