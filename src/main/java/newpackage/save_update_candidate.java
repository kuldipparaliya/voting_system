package newpackage;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/save_update_candidate")
public class save_update_candidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public save_update_candidate() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voter_id = (String)request.getSession(false).getAttribute("voterid");
		String page = "";
	   	if(voter_id == null || voter_id.isEmpty()){
	   		page = "../login.jsp";
	   	}
	   	
	   	int cid = Integer.parseInt(request.getParameter("cid"));
	    String candidate_name = request.getParameter("candidate_name");
	    int booth_id = Integer.parseInt(request.getParameter("candidate-booth"));
	    String c_image = request.getParameter("candidate_image");

		try {
			String className = request.getServletContext().getInitParameter("class");
			Class.forName(className);
	    	String url = request.getServletContext().getInitParameter("url");
	    	String username = request.getServletContext().getInitParameter("username");
	    	String pass = request.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("update contenstant set c_name = ?,booth_id = ?,c_image =?  where c_id = ?");
			pst.setString(1,candidate_name);
			pst.setInt(2,booth_id);
			pst.setString(3,c_image);
			pst.setInt(4,cid);
			pst.executeUpdate();
			page = "candidateList.jsp";	
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(page);
	}
}
