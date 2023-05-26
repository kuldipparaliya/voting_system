package newpackage;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/save_update_booth")
public class save_update_booth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public save_update_booth() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voter_id = (String)request.getSession(false).getAttribute("voterid");
		String page = "";
	   	if(voter_id == null || voter_id.isEmpty()){
	   		page = "../login.jsp";
	   	}
	   	
	   	String booth_name = request.getParameter("booth_title");
	    int total_voter = Integer.parseInt(request.getParameter("total_voter"));
	    String booth = request.getParameter("booth_name");
	    System.out.println(booth);
		try {
			String className = request.getServletContext().getInitParameter("class");
			Class.forName(className);
	    	String url = request.getServletContext().getInitParameter("url");
	    	String username = request.getServletContext().getInitParameter("username");
	    	String pass = request.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("update booth set booth_name = ?,total_voter = ?  where booth_name = ?");
			pst.setString(1,booth);
			pst.setInt(2,total_voter);
			pst.setString(3,booth_name);
			pst.executeUpdate();
			page = "boothList.jsp";
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		response.sendRedirect(page);
		
	}

}
