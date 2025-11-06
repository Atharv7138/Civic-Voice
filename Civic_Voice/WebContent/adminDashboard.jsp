<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="com.Civic.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>

<style>
#card a:hover{
	text-decoration: none;
}

.cardl:hover{
    transform: scale(1.05);
}
#card{
	text-decoration: none;
}
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background: #AEB1B4;
  color: #00000;
}
</style>
</head>
<body>
<div class="d-flex dashboard vh-100">
    <aside class="sidebar text-white p-3">
      <a href="adminDashboard.jsp"><h3 class="mb-4" style=color:white;>Admin Panel</h3></a>
      <nav class="nav flex-column">
        <a href="ViewAllOfficer's.jsp" class="nav-link px-0 py-2">View Officer</a>
		<a href="ApproveOfficerManual.jsp" class="nav-link px-0 py-2">Approve Officer</a>
		<a href="disApproveOfficerManual.jsp" class="nav-link px-0 py-2">Dis-Approve Officer</a>
		<a href="viewAllCitizen's.jsp" class="nav-link px-0 py-2">View Citizen</a>
		<a href="viewAllGrivanance.jsp">View Grivances</a>
		<a href="index.html">logout</a>
      </nav>
    </aside>
    
<% Connection con = DBConnection.connect();
try{
	PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM officer;");
	ResultSet rs=pstmt.executeQuery();
	if(rs.next()){
	%>
	
<main class="main flex-fill p-4 bg-light">
      <h2>Welcome, Admin!</h2>
      <div class="row mt-4">
        <div class="col-md-4">
        <div class="cardl">
              <a href="ViewAllOfficer's.jsp" id="card">
        
          <div class="card card-stat shadow-sm p-3 mb-3 bg-white">
            <div class="card-body">
              <h5 class="card-title">Total Officers</h5>
              <p class="display-4"><%=rs.getInt(1)%></p>
             
            </div>            
          </div>         
          </a>
        </div>
        </div>
        
	<%}

}catch(Exception e){
	e.printStackTrace();
}
%>    
    
<% 
try{
	PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM grievances;");
	ResultSet rs2=pstmt.executeQuery();
	if(rs2.next()){
		rs2.getInt(1);
	%>
        <div class="col-md-4">
			<div class="cardl">
        	<a href="viewAllGrivanance.jsp" id="card">
        
          <div class="card card-stat shadow-sm p-3 mb-3 bg-white">
            <div class="card-body">
              <h5 class="card-title">Total Grievances</h5>
              <p class="display-4"><%=rs2.getInt(1)%></p>
            </div>
          </div>
          </a>
          </div>
        </div>
       
	<%}

}catch(Exception e){
	e.printStackTrace();
}
%>
        
        
 <% 
try{
	PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM citizen;");
	ResultSet rs3=pstmt.executeQuery();
	if(rs3.next()){
		rs3.getInt(1);
	%>       
        
        <div class="col-md-4">
        <div class="cardl">
          <a href="viewAllCitizen's.jsp" id="card">
        
          <div class="card card-stat shadow-sm p-3 mb-3 bg-white">
            <div class="card-body">
              <h5 class="card-title">Citizens Registered</h5>
              <p class="display-4"><%=rs3.getInt(1)%></p>
            </div>
          </div>
          </a>
          </div>
        </div>    
      </div>
     
    </main>
    
  </div>
	<%}

}catch(Exception e){
	e.printStackTrace();
}
%>
  
</body>
</html>
</body>
</html>