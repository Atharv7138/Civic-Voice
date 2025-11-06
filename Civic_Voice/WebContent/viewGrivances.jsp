<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.Civic.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Grievances</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="style.css" rel="stylesheet">
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

  <!-- Main Content -->
  <div class="main-content w-100 p-4">
    <h2 class="mb-4 text-center">My Grievances</h2>
    <div class="table-responsive">
      <table class="table table-striped custom-table">
        <thead class="table-primary">
          <tr>
            <th>Grievance ID</th>
            <th>Citizen ID</th>
            <th>Grievance Text</th>
            <th>Date of Grievance</th>
            <th>Officer ID</th>
            <th>Officer Department</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
          <%
            Connection con = DBConnection.connect();
            int cid = Session.getCsrno();

            try {
              PreparedStatement pstmt = con.prepareStatement("select * from grievances where cid = ?");
              pstmt.setInt(1, cid);
              ResultSet rs = pstmt.executeQuery();

              while(rs.next()) {
          %>
          <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getInt(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(4) %></td>
            <td>
              <a href="deleteGrivance?srno=<%= rs.getInt(1) %>" class="btn btn-sm btn-danger">Delete</a>
            </td>
          </tr>
          <%
              }
            } catch(Exception e) {
              e.printStackTrace();
            }
          %>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>