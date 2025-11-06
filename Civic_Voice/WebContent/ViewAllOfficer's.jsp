<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.Civic.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Officer's</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="style.css" rel="stylesheet">
</head>
<body>

<div class="d-flex dashboard vh-100">
  <!-- Sidebar -->
  <aside class="sidebar text-white p-3">
    <a href="adminDashboard.jsp"><h3 class="mb-4" style="color:white;">Admin Panel</h3></a>
    <nav class="nav flex-column">
      <a href="ViewAllOfficer's.jsp" class="nav-link px-0 py-2">View Officer</a>
      <a href="ApproveOfficerManual.jsp" class="nav-link px-0 py-2">Approve Officer</a>
      <a href="disApproveOfficerManual.jsp" class="nav-link px-0 py-2">Dis-Approve Officer</a>
      <a href="viewAllCitizen's.jsp" class="nav-link px-0 py-2">View Citizen</a>
      <a href="viewAllGrivanance.jsp" class="nav-link px-0 py-2">View Grievances</a>
      <a href="index.html" class="nav-link px-0 py-2">Logout</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <div class="main-content w-100 p-4">
    <h2 class="mb-4 text-center">Officer's List</h2>
    <div class="table-responsive">
      <table class="table table-striped custom-table">
        <thead class="table-primary">
          <tr>
            <th>Officer ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Contact</th>
            <th>Email</th>
            <th>Status</th>
            <th>Approve</th>
            <th>Disapprove</th>
          </tr>
        </thead>
        <tbody>
          <%
            Connection con = DBConnection.connect();
            String dept = Session.getDept();

            try {
              PreparedStatement pstmt = con.prepareStatement("select * from officer");
              ResultSet rs = pstmt.executeQuery();

              while (rs.next()) {
          %>
          <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(7) %></td>
            <td>
              <a href="approveOfficer?srno=<%= rs.getInt(1) %>" class="btn btn-sm btn-success">Approve</a>
            </td>
            <td>
              <a href="disApproveOfficer?srno=<%= rs.getInt(1) %>" class="btn btn-sm btn-danger">Disapprove</a>
            </td>
          </tr>
          <%
              }
            } catch (Exception e) {
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