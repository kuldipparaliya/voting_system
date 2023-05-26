<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String voter_id = (String)session.getAttribute("voter_id");
	if(voter_id != null ){
		response.sendRedirect("voterDetail.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
 <link rel="stylesheet" href="css/login.css" />
</head>
<body>
<section>
      <div class="container">
        <div class="form-container">
          <form action="loginServlet" method="post">
            <div class="user-data">
              <div class="container-header">
                <h1 class="head">Please enter Voter ID::</h1>
              </div>

              <div class="username">
                <label for="uname">VOTER ID</label>
                <input
                  type="text"
                  id="uname"
                  name="uname"
                  class="uname"
                  required
                />
              </div>

              <div class="book-save">
                <input
                  type="submit"
                  class="save"
                  value="PROCEED"
                  name="login"
                />
              </div>
            </div>
          </form>
         <% 
         	String msg = request.getParameter("msg");
            if("invalid".equals(msg)){
         %>
          <div class="error">
              <h1>Invalid Voter ID!!</h1>
          </div>
          <%} %>
         </div>
      </div>
    </section>

</body>
</html>