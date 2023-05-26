package newpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/admin/saveBooth")
public class saveBooth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public saveBooth() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voter_id = (String)request.getParameter("voter_id");
		String page = "";
	   	if(voter_id == null || voter_id.isEmpty()){
	   		page = "../login.jsp";
	   	}
	   	
	   	String booth_name = request.getParameter("booth_name");
		String total_voter = request.getParameter("total_voter");
		
		try {
			String className = request.getServletContext().getInitParameter("class");
			Class.forName(className);
	    	String url = request.getServletContext().getInitParameter("url");
	    	String username = request.getServletContext().getInitParameter("username");
	    	String pass = request.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("insert into booth(booth_name,total_voter) values(?,?)");
			pst.setString(1,booth_name);
			pst.setString(2,total_voter);
			pst.executeUpdate();
			page = "boothList.jsp";
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		response.sendRedirect(page);
	}

}
