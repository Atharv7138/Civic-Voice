<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.Civic.*" %>
<%@page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Respond to Grievance</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="style.css" rel="stylesheet">
  
  <style>
    body {
      background-color: #f8f9fa;
    }
    .response-container {
      max-width: 600px;
      margin: 80px auto;
      padding: 30px;
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0,0,0,0.1);
    }
    h3 {
      margin-bottom: 25px;
    }
    label {
      font-weight: 600;
    }
    .btn {
      margin-top: 15px;
    }
    .message {
      margin-top: 20px;
      color: green;
      font-weight: bold;
    }
  </style>
</head>
<body>
<div class="d-flex dashboard vh-100">
    <aside class="sidebar text-white p-3">
      <a href="officerDashboard.html"><h3 class="mb-4">Officer Panel</h3></a>
      <nav class="nav flex-column">
        <a class="nav-link px-0 py-2" href="officerView.jsp">View Grievances</a>
        <a class="nav-link px-0 py-2" href="#">View Pending Work</a>
      </nav>
    </aside>
  <div class="response-container">
    <%
      String message = "";
      String pidStr = request.getParameter("srno");

      if (pidStr == null || pidStr.isEmpty()) {
          message = "No ID provided.";
      } else {
    %>
      <h3>Add Response for Grievance ID: <%= pidStr %></h3>
      <form action="addResponse.jsp" method="post">
  <div class="mb-3">
    <label for="responseText" class="form-label">Enter Response:</label>
    <textarea name="Response" id="responseText" class="form-control" rows="5" placeholder="Type your response here..." required></textarea>
    <input type="hidden" name="srno" value="<%= pidStr %>">
  </div>
  <button type="submit" class="btn btn-primary w-100">Submit</button>
</form>
    <%
        String Response = request.getParameter("Response");
    	String oid=Session.getOid();
        if (Response != null && !Response.trim().isEmpty()) {
            LocalDate currentDate = LocalDate.now();
            try {
                int pid = Integer.parseInt(pidStr);
                Connection con = DBConnection.connect();
                PreparedStatement pstmt = con.prepareStatement("UPDATE grievances SET oid=?, response = ?, rdate = ? WHERE gsrno = ?");
                pstmt.setString(1, oid);
                pstmt.setString(2, Response);
                pstmt.setString(3, currentDate.toString());
                pstmt.setInt(4, pid);
                int i = pstmt.executeUpdate();

                if (i > 0) {
                    response.sendRedirect("officerDashboard.html");
                } else {
                    response.sendRedirect("Error.html");
                }

                pstmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                message = "Error occurred: " + e.getMessage();
            }
        }
      }
    %>
    <% if (!message.isEmpty()) { %>
      <p class="message"><%= message %></p>
    <% } %>
  </div>
  </div>
</body>
</html>