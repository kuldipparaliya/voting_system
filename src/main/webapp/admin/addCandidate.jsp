<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Candidate Page</title>
<link rel="stylesheet" href="css/addCandidate.css" />
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
    
    <section>
      <div class="section-container">
        <div class="container-header">
          <h1 class="head">ADD CANDIDATE</h1>
        </div>
        <div class="form-container">
        <% int booth_id = Integer.parseInt(request.getParameter("candidate-party")); 
        String voterid = (String)session.getAttribute("voterid");
        String className = pageContext.getServletContext().getInitParameter("class");
		Class.forName(className);
    	String url = pageContext.getServletContext().getInitParameter("url");
    	String username = pageContext.getServletContext().getInitParameter("username");
    	String pass = pageContext.getServletContext().getInitParameter("password");
		Connection con = DriverManager.getConnection(url,username,pass);
  		PreparedStatement pst = con.prepareStatement("select * from booth where booth_id not in (select booth_id from contenstant where party_id = ?);");
  		pst.setInt(1,booth_id);
  		ResultSet rs = pst.executeQuery();
  		if(rs.next()){
        %>
          <form action="saveCandidate" name="add-candidate" method="post">
            <div class="candidate-data">
              <div class="candidate_name">
                <label for="candidate_name">Candidate Name</label>
                <input type="text" id="candidate_name" name="candidate_name" required class="title" />
              </div>
              <input type="hidden" name="party_id" value=<%=booth_id %>>
              
              <input type="hidden" name="voter_id" value=<%=voterid %>>
              
              <div class="candidate_booth">
              <label for="candidate_booth">Candidate Booth</label>
              
              <select name="candidate-booth" id="candidate_booth">
                  <option disabled>Select Booth</option>
                  <%
                  PreparedStatement pst1 = con.prepareStatement("select * from booth where booth_id not in (select booth_id from contenstant where party_id = ?);");
            	  pst1.setInt(1,booth_id);
            	  ResultSet rs1 = pst1.executeQuery();
          		
          		while(rs1.next()){
          			%>
          			<option value=<%= rs1.getInt("booth_id") %>><%= rs1.getString("booth_name") %></option>
          			<%} %>
         
                </select>
              </div>           
              <div class="candidate-image">
                <label for="image">Candidate-image</label>
                <input type="text" class="image" id="image" name="candidate_image" required />
              </div>
              <div class="candidate-save">
                <input type="submit" class="save" value="save" name="save" />
                <input type="reset" class="reset" value="Reset" name="reset" />
              </div>
            </div>
          </form>
          <%}else{
        	  %>
        	  <h1 class="error">Already Booth Candidate Added!!</h1>
        	  <%} %>        
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