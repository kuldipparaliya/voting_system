package newpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/admin/saveCandidate")
public class saveCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public saveCandidate() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voter_id = (String)request.getParameter("voter_id");
		String page = "";
	   	if(voter_id == null || voter_id.isEmpty()){
	   		page = "../login.jsp";
	   	}

		String candidate_name = request.getParameter("candidate_name");
		int party_id = Integer.parseInt(request.getParameter("party_id"));
		int booth_id = Integer.parseInt(request.getParameter("candidate-booth"));
		String candidate_image= request.getParameter("candidate_image");
		try {
			String className = request.getServletContext().getInitParameter("class");
			Class.forName(className);
	    	String url = request.getServletContext().getInitParameter("url");
	    	String username = request.getServletContext().getInitParameter("username");
	    	String pass = request.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("insert into contenstant(c_name,party_id,booth_id,c_image) values(?,?,?,?)");
			pst.setString(1,candidate_name);
			pst.setInt(2,party_id);
			pst.setInt(3,booth_id);
			pst.setString(4,candidate_image);
			pst.executeUpdate();
			page = "candidateList.jsp";
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		response.sendRedirect(page);
	}

}
