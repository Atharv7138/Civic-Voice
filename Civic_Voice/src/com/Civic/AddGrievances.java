package com.Civic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/AddGrievances")
public class AddGrievances extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
       
    public AddGrievances() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DBConnection.connect();
		LocalDate currentDate = LocalDate.now();


		int gsrno=0;
		int cid =Session.getCsrno();
		String grivance=request.getParameter("grievances");
		String departmant=request.getParameter("departmant");
		String oid = "0";
		String responses = "Waiting For Response";
		String rdate="0000-01-01";

		try {
			PreparedStatement pstmt = con.prepareStatement("insert into grievances values (?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, gsrno);
			pstmt.setInt(2, cid);
			pstmt.setString(3, grivance);
			pstmt.setString(4, departmant);
			pstmt.setString(5, currentDate.toString());
			pstmt.setString(6, oid);
			pstmt.setString(7, responses);
			pstmt.setString(8, rdate);
			int i = pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("cityzenDashboard.jsp");
			}else{
				response.sendRedirect("error.html");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
			doGet(request, response);
		
	}

}
