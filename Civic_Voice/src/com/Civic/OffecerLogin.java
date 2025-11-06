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
 * Servlet implementation class OffeserLogin
 */
@WebServlet("/OffeserLogin")
public class OffecerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OffecerLogin() {
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
		Connection con = DBConnection.connect();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM officer WHERE (oemail = ? OR ouserid = ?) AND opassword = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, pass);

			ResultSet rs= pstmt.executeQuery();
			if(rs.next()){
				String status =rs.getString(7);
				String sstatus = "Approved";
				if(status.equals(sstatus)){
					String oid = rs.getString(1);
					Session.setOid(oid);
					
					String dept = rs.getString(3);
					Session.setDept(dept);
					response.sendRedirect("officerDashboard.html");
				}else{
					response.sendRedirect("OfficerNotApproved.html");
				}
			}else{
				response.sendRedirect("offecerLogin.html");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
