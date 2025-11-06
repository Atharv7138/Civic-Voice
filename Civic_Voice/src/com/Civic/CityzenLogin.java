package com.Civic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CityzenLogin
 */
@WebServlet("/CityzenLogin")
public class CityzenLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityzenLogin() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DBConnection.connect();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM citizen WHERE (ccontact = ? OR cemail = ?) AND cpassword = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, pass);

			ResultSet rs= pstmt.executeQuery();
			if(rs.next()){
				
				int srno= rs.getInt(1);
				Session.setCsrno(srno);
				System.out.println(srno);
				
				response.sendRedirect("cityzenDashboard.jsp");
			}else{
				response.sendRedirect("cityzenLogin.html");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		doGet(request, response);
	}

}
