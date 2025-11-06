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
      padding: 0;
    }

    .dashboard {
      display: flex;
      height: 100vh;
    }

    .sidebar {
      width: 250px;
      background-color: #142a6e;
    }

    .sidebar h3 {
      color: white;
    }

    .nav-link {
      color: white;
      font-weight: 500;
    }

    .nav-link:hover {
      text-decoration: underline;
    }

    .form-container {
      flex-grow: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 40px;
    }

    .form-box {
      background-color: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 600px;
    }

    label {
      font-weight: 600;
    }

    select, input[type="text"], button {
      margin-top: 10px;
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

    <!-- Form Section -->
    <div class="form-container">
      <div class="form-box">
        <form action="AddGrievances" method="post">
          <div class="mb-3">
           <label for="userMessage" class="form-label">Your Message</label>
  <textarea class="form-control" name="grievances" rows="4" placeholder="Type your message here..."></textarea>
		
          </div>

          <div class="mb-3">
            <label class="form-label">Select Department Name:</label>
            <select name="departmant" class="form-select" required>
              <option value="Not Determined" disabled selected>Not Determined</option>
              <%
                Connection con = DBConnection.connect();
                String st = "Approved";
                try {
                  PreparedStatement pstmt = con.prepareStatement("select * from officer where status = ?");
                  pstmt.setString(1, st);
                  ResultSet rs = pstmt.executeQuery();
                  while(rs.next()) {
              %>
                <option value="<%= rs.getString(3) %>"><%= rs.getString(3) %></option>
              <%
                  }
                } catch(Exception e) {
                  e.printStackTrace();
                }
              %>
            </select>
          </div>

          <button type="submit" class="btn btn-primary w-100">Submit</button>
        </form>
      </div>
    </div>
  </div>

</body>
</html>