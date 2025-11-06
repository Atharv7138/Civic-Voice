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
 * Servlet implementation class OffecerRegister
 */
@WebServlet("/OffecerRegister")
public class OffecerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OffecerRegister() {
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
		int id=0;
		String oname =request.getParameter("oname");
		String odepartmant=request.getParameter("odepartmant");
		String ouserid=request.getParameter("ouserid");
		String oemail=request.getParameter("oemail");
		String opass=request.getParameter("opass");
		String status="Pending";
		

		
		try {
			PreparedStatement pstmt = con.prepareStatement("INSERT INTO officer VALUES (?,?,?,?,?,?,?)");
			pstmt.setInt(1, id);
			pstmt.setString(2, oname);
			pstmt.setString(3, odepartmant);
			pstmt.setString(4, ouserid);
			pstmt.setString(5, oemail);
			pstmt.setString(6, opass);
			pstmt.setString(7, status);
			
			int i = pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("offcerLogin.html");
			}else{
				response.sendRedirect("OffeserRegister.html");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}		doGet(request, response);
	}

}
