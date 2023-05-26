<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Voter Page</title>
<link rel="stylesheet" href="css/addVoter.css" />
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
          <h1 class="head">ADD VOTER</h1>
        </div>
        <div class="form-container">
        
          <form action="saveVoter" name="add-voter" method="post">
            <div class="voter-data">
            <%
            	String voter = (String)request.getSession(false).getAttribute("voter");
            
            	if(voter == "true"){
            		
            	
            %>
                <div>
            		<p class="error">Voter_id is already exists!!</p>
            	</div>
            	<%} %>
              <div class="voter_id">
                <label for="voter_id">Voter Id</label>
                <input type="text" id="voter_id" name="voter_id" min=10 max=10 required class="title" />
              </div>
              <%
              	String voterid = (String)session.getAttribute("voterid");
              %>
              <div class="voter_name">
                <label for="voter_name">Voter Name</label>
                <input type="text" id="voter_name" name="voter_name" required class="name" />
              </div>
              <input type="hidden" name="voter_id" value=<%=voterid %>/>
              <div class="voter_age">
                <label for="voter_age">Voter Age</label>
                <input type="text" id="voter_age" name="voter_age" required class="age" />
              </div>
              
              <div class="voter_booth">
              <label for="voter_booth">Voter Booth</label>
              
              <select name="voter_booth" id="voter_booth">
                  <option disabled>Select Booth</option>
                  <%
                  	String className = pageContext.getServletContext().getInitParameter("class");
      				Class.forName(className);
              		String url = pageContext.getServletContext().getInitParameter("url");
              		String username = pageContext.getServletContext().getInitParameter("username");
              		String pass = pageContext.getServletContext().getInitParameter("password");
      				Connection con = DriverManager.getConnection(url,username,pass);
                 	PreparedStatement pst1 = con.prepareStatement("select * from booth");
            	  	ResultSet rs1 = pst1.executeQuery();
          		
          		while(rs1.next()){
          			%>
          			<option value=<%= rs1.getInt("booth_id") %>><%= rs1.getString("booth_name") %></option>
          			<%} %>  
                </select>
              </div>
              
              <div class="voter-image">
                <label for="image">Voter-image</label>
                <input type="text" class="image" id="image" name="voter_image"/>
              </div>
              <div class="candidate-save">
                <input type="submit" class="save" value="save" name="save" />
                <input type="reset" class="reset" value="Reset" name="reset" />
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