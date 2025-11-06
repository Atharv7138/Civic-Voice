<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@page import="com.Civic.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>
<body>

</body><!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Grievance Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="style.css" rel="stylesheet">
  <style>
  .cardl:hover{
    transform: scale(1.05);
  }
  .cardl a{
  text-decoration:none;
  color:black;
  }
  </style>
</head>
<body>
  <div class="d-flex dashboard vh-100">
    <!-- Sidebar -->
    <aside class="sidebar text-white p-3">
      <a href="cityzenDashboard.jsp"><h3 class="mb-4" style=color:white;>Grievance Panel</h3></a>
      <nav class="nav flex-column">
        <a href="addgrievances.jsp" class="nav-link text-white px-0 py-2">Add Grievance</a>
        <a href="viewGrivances.jsp" class="nav-link text-white px-0 py-2">View All Grievances</a>
        <a href="viewResponces.jsp" class="nav-link text-white px-0 py-2">View Responses</a>
        <a href="index.html" class="nav-link text-white px-0 py-2">Log Out</a>
      </nav>
    </aside>
    
    
<% Connection con = DBConnection.connect();
String responsed="Waiting For Response";
int cid=Session.getCsrno();

try{
	PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM grievances where cid= ?");
	pstmt.setInt(1, cid);
	ResultSet rs=pstmt.executeQuery();
	if(rs.next()){
	%>
    <!-- Main Content -->
    <main class="main flex-fill p-4 bg-light">
      <h2>Welcome to the Grievance Dashboard!</h2>
      
      <div class="row mt-4">
        <div class="col-md-4">
         <div class=cardl>
         <a href="viewGrivances.jsp">
          <div class="card shadow-sm p-3 bg-white">
            <div class="card-body">
              <h5 class="card-title">Grievances Submitted</h5>
              <p class="display-6"><%=rs.getInt(1)%></p>
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
	PreparedStatement pstmt2 = con.prepareStatement("SELECT COUNT(*) FROM grievances where cid=? AND response != ?");
	pstmt2.setInt(1, cid);
	pstmt2.setString(2, responsed);
	ResultSet rs2=pstmt2.executeQuery();
	if(rs2.next()){
		rs2.getInt(1);
	%>
        
        <div class="col-md-4">
		<div class=cardl>
          <div class="card shadow-sm p-3 bg-white">
         <a href="viewResponces.jsp">
            <div class="card-body">
              <h5 class="card-title">Responses Issued</h5>
              <p class="display-6"><%=rs2.getInt(1)%></p>
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
	PreparedStatement pstmt3 = con.prepareStatement("SELECT COUNT(*) FROM grievances where cid=? AND response = ?");
	pstmt3.setInt(1, cid);
	pstmt3.setString(2, responsed);
	ResultSet rs3=pstmt3.executeQuery();
	if(rs3.next()){
		rs3.getInt(1);
	%> 
        
        <div class="col-md-4">
          <div class=cardl>
          <div class="card shadow-sm p-3 bg-white">
         <a href="viewResponces.jsp">
            <div class="card-body">
              <h5 class="card-title">Pending Actions</h5>
              <p class="display-6"><%=rs3.getInt(1)%></p>
            </div>
          </div>
		 </a>
        </div>
        </div>    </main>
  </div>
  	<%}

}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>
</html>