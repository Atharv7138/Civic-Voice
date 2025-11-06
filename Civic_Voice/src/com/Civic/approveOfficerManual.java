package com.Civic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class approveOfficerManual
 */
@WebServlet("/approveOfficerManual")
public class approveOfficerManual extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public approveOfficerManual() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DBConnection.connect();
		String status = "Approved";
		int id=Integer.parseInt(request.getParameter("srno"));
		
		try {
			PreparedStatement pstmt = con.prepareStatement("update officer set status = ? where oid = ?");
			pstmt.setString(1, status);
			pstmt.setInt(2, id);
			int i = pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("ApproveOfficerManual.jsp");
			}	
		} catch (SQLException e) {
			e.printStackTrace();		
	}		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
