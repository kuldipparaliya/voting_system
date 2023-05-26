package newpackage;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/saveVoter")
public class saveVoter extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public saveVoter() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String voterid = (String)request.getSession(false).getAttribute("voterid");
		String page = "";
	   	if(voterid == null || voterid.isEmpty()){
	   		page = "../login.jsp";
	   	}
	   	String className = request.getServletContext().getInitParameter("class");
		String url = request.getServletContext().getInitParameter("url");
    	String username = request.getServletContext().getInitParameter("username");
    	String pass = request.getServletContext().getInitParameter("password");

		String voter_id = request.getParameter("voter_id");
		try {
			Class.forName(className);
			Connection con = DriverManager.getConnection(url,username,pass);
			PreparedStatement pst = con.prepareStatement("select * from voter where voter_id = ?");
			pst.setString(1, voter_id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				request.getSession(false).setAttribute("voter","true" );
				page = "addVoter.jsp";
			}else {
				String voter_name = request.getParameter("voter_name");
				int voter_age = Integer.parseInt(request.getParameter("voter_age"));
				int booth_id = Integer.parseInt(request.getParameter("voter_booth"));
				String voter_image= request.getParameter("voter_image");
				if(voter_image.isEmpty() || voter_image == null){
					voter_image = "author-1.jpg";
				}
				try {
					int i =0 ;
					PreparedStatement pst1 = con.prepareStatement("insert into voter(voter_id,voter_name,age,booth_id,vote,voter_img) values(?,?,?,?,?,?)");
					pst1.setString(1,voter_id);
					pst1.setString(2,voter_name);
					pst1.setInt(3,voter_age);
					pst1.setInt(4,booth_id);
					pst1.setInt(5,i);
					pst1.setString(6,voter_image);
					pst1.executeUpdate();
					page = "voterList.jsp";
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(page);
	}

}
