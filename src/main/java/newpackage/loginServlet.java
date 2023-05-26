package newpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public loginServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String voterid = request.getParameter("uname");
		String page = "";
		if("11".equals(voterid)) {
			HttpSession session = request.getSession();
			session.setAttribute("voterid", voterid);
			page= "admin/index.jsp";
			
		}else {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/votingsystem","root","Kuldip@2411");
				PreparedStatement pst = con.prepareStatement("select * from voter where voter_id = ?");
				pst.setString(1,voterid);
				ResultSet rs = pst.executeQuery();
				int vote = 1;
				
				if(!rs.next()) {
					page = "login.jsp?msg=invalid";
					
				}else {
					HttpSession session = request.getSession();
					session.setAttribute("voter_id", voterid);
					page = "voterDetail.jsp";
				}
				
			}catch(Exception e) {
				page = "login.jsp?msg=invalid";
			}
		}
		response.sendRedirect(page);
	}

}
