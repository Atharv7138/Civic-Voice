package com.Civic;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterCityzen
 */
@WebServlet("/RegisterCityzen")
public class RegisterCityzen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCityzen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con= DBConnection.connect();
		
		int csrno=0;
		String cfname=request.getParameter("cfname");
		String clname=request.getParameter("clname");
		String caddress=request.getParameter("caddress");
		String ccontact=request.getParameter("ccontact");
		String cemail=request.getParameter("cemail");
		String cpass=request.getParameter("cpass");
		
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into citizen values (?,?,?,?,?,?,?)");
			pstmt.setInt(1, csrno);
			pstmt.setString(2, cfname);
			pstmt.setString(3, clname);
			pstmt.setString(4, caddress);
			pstmt.setString(5, ccontact);
			pstmt.setString(6, cemail);
			pstmt.setString(7, cpass);
			
			int i = pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("cityzenLogin.html");
			}else{
				response.sendRedirect("registerCityzen.html");
				
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		doGet(request, response);
	}

}
