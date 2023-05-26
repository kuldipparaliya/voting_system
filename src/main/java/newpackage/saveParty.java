package newpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/saveParty")
public class saveParty extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public saveParty() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voter_id = (String)request.getParameter("voter_id");
		String page = "";
	   	if(voter_id == null || voter_id.isEmpty()){
	   		page = "../login.jsp";
	   	}
	   	
	   	String party_name = (String)request.getParameter("party_name");
	   	String party_symbol = (String)request.getParameter("party_image");
	   	
	   	try {
			String className = request.getServletContext().getInitParameter("class");
			Class.forName(className);
	    	String url = request.getServletContext().getInitParameter("url");
	    	String username = request.getServletContext().getInitParameter("username");
	    	String pass = request.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("insert into party(party_name,party_symbol) values(?,?)");
			pst.setString(1,party_name);
			pst.setString(2,party_symbol);
			pst.executeUpdate();
			page = "index.jsp";
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	   	
		response.sendRedirect(page);
	}

}
