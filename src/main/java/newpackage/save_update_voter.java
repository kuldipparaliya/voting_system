package newpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/admin/save_update_voter")
public class save_update_voter extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public save_update_voter() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voter_id = (String)request.getSession(false).getAttribute("voterid");
		String page = "";
	   	if(voter_id == null || voter_id.isEmpty()){
	   		page = "../login.jsp";
	   	}
	   	
	   	int v_no = Integer.parseInt(request.getParameter("v_no"));
	    voter_id =request.getParameter("voter_id");
	    String voter_name = request.getParameter("voter_name");
	    int age = Integer.parseInt(request.getParameter("voter_age"));
	    int voter_booth = Integer.parseInt(request.getParameter("voter_booth"));
	    String voter_image = request.getParameter("voter_image");

		try {
			String className = request.getServletContext().getInitParameter("class");
			Class.forName(className);
	    	String url = request.getServletContext().getInitParameter("url");
	    	String username = request.getServletContext().getInitParameter("username");
	    	String pass = request.getServletContext().getInitParameter("password");
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("update voter set voter_id = ?,voter_name = ?,age =?,booth_id = ?,voter_img=?  where v_no = ?");
			pst.setString(1,voter_id);
			pst.setString(2,voter_name);
			pst.setInt(3,age);
			pst.setInt(4,voter_booth);
			pst.setString(5,voter_image);
			pst.setInt(6,v_no);
			pst.executeUpdate();
			page = "voterList.jsp";
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		response.sendRedirect(page);
	}

}
