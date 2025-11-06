<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.Civic.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Grievances</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="style.css" rel="stylesheet">
  
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
    }

    .dashboard {
      height: 100vh;
    }

    .sidebar {
      width: 250px;
      background-color: #142a6e;
    }

    .sidebar h3 {
      color: white;
    }

    .sidebar .nav-link {
      color: white;
      font-weight: 500;
    }

    .sidebar .nav-link:hover {
      text-decoration: underline;
    }

    .main-content {
      flex-grow: 1;
      padding: 30px;
    }

    .table-container {
      background-color: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    th {
      background-color: #142a6e;
      color: white;
      text-align: center;
    }

    td {
      text-align: center;
      vertical-align: middle;
    }

    .btn-sm {
      font-size: 0.85em;
      padding: 4px 8px;
    }
  </style>
</head>
<body>
<div class="d-flex dashboard">
  <!-- Sidebar -->
  <aside class="sidebar text-white p-3">
      <a href="officerDashboard.html"><h3 class="mb-4">Officer Panel</h3></a>
    <nav class="nav flex-column">
      <a class="nav-link px-0 py-2" href="officerView.jsp">View Grievances</a>
      <a class="nav-link px-0 py-2" href="officerPendingWork.jsp">View Pending Work</a>
      <a href="index.html" class="nav-link text-white px-0 py-2">Log Out</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <div class="main-content">
    <div class="table-container">
      <h2>Department Grievances</h2>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <th>Grievance ID</th>
              <th>Citizen ID</th>
              <th>Grievance Text</th>
              <th>Date of Grievance</th>
              <th>Officer ID</th>
              <th>Officer Department</th>
              <th>Response</th>
            </tr>
          </thead>
          <tbody>
            <%
              Connection con = DBConnection.connect();
              String dept = Session.getDept();
              try {
                PreparedStatement pstmt = con.prepareStatement("SELECT * FROM grievances WHERE departmant = ?");
                pstmt.setString(1, dept);
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
                <a href="addResponse.jsp?srno=<%= rs.getInt(1) %>"><%= rs.getString(7)%></a>
              </td>
            </tr>
            <%
                }
              } catch(Exception e){
                e.printStackTrace();
              }
            %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>