<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>404 Error</title>
    
    <style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background-image: url(error.jpg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}

.link-box {
  text-align: center;
  margin-top: 345px;
}
.link:link,
.link:visited {
  text-align: center;
  text-decoration: none;
  font-size: 24px;
  color: white;
  background-color: rgb(254, 73, 73);
  padding: 10px;
  border-radius: 3px;
  font-weight: bold;
}

.link:hover,
.link:active {
  color: #444;
  background-color: transparent;
  border: 3px solid rgb(254, 73, 73);
  text-decoration: underline;
}
    </style>
  </head>
  <body >
    <div class="link-box">
    <%
    	String voter_id = (String)session.getAttribute("voterid");
    	if("11".equals(voter_id)){
    %>
      <a href="../index.jsp" class="link">Go to Home Page &rarr;</a>
      <%}else{ %>
      <a href="voterDetail.jsp" class="link">Go to Home Page &rarr;</a>
      <%} %>
    </div>
  </body>
</html>