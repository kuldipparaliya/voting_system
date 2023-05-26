package newpackage;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/save_update_party")
public class save_update_party extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public save_update_party() {
        super();
            }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voter_id = (String)request.getSession(false).getAttribute("voterid");
		String page = "";
	   	if(voter_id == null || voter_id.isEmpty()){
	   		page = "../login.jsp";
	   	}

	    String party_name = request.getParameter("party_name");
	    String party = request.getParameter("party");
	    String party_symbol = request.getParameter("party_symbol");

		try {
			String className = request.getServletContext().getInitParameter("class");
			Class.forName(className);
	    	String url = request.getServletContext().getInitParameter("url");
	    	String username = request.getServletContext().getInitParameter("username");
	    	String pass = request.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("update party set party_name = ?, party_symbol = ? where party_name = ?");
			pst.setString(1,party_name);
			pst.setString(2,party_symbol);
			pst.setString(3,party);
			pst.executeUpdate();
			page = "index.jsp";
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(page);
	   	
	}

}
