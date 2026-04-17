<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Students Table</title>
  <style>
    table { width: 80%; margin: 20px auto; border-collapse: collapse; }
    th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
    th { background-color: #f4f4f4; }
    button { margin: 2px; padding: 5px 10px; border: none; cursor: pointer; border-radius: 3px; }
    .delete { color: black; }
    .update { color: black; }
    .details { color: white; }

    nav {
      width: 100%;
      height: 60px;
      display: flex;
      justify-content: space-evenly;
    }
    nav>button {
      width: auto;
      height: 50px;
      padding: 0 15px;
    }
    nav>button>a {
      text-decoration: none;
    }
  </style>
</head>
<body>

<nav>
  <button><a href="addStudent.jsp">Add Student</a></button>
  <button><a href="display.jsp">Display Students</a></button>
</nav>

<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Course</th>
      <th>Age</th>
      <th>CGPA</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <%
      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

      try {
          Class.forName("org.postgresql.Driver");
          conn = DriverManager.getConnection(
              "jdbc:postgresql://192.168.1.17/cse_db24",
              "24bcsb08",
              "24bcsb08"
          );

          String sql = "SELECT id, name, email, course, age, cgpa FROM student3 ORDER BY id";
          ps = conn.prepareStatement(sql);
          rs = ps.executeQuery();

          while(rs.next()) {
    %>
            <tr>
              <td><%= rs.getInt("id") %></td>
              <td><%= rs.getString("name") %></td>
              <td><%= rs.getString("email") %></td>
              <td><%= rs.getString("course") %></td>
              <td><%= rs.getInt("age") %></td>
              <td><%= rs.getBigDecimal("cgpa") %></td>
              <td>
                <button class="delete">Delete</button>
                <button class="update">Update</button>
                <button class="details">Details</button>
              </td>
            </tr>
    <%
          }
      } catch(Exception e) {
          out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
      } finally {
          if(rs != null) try { rs.close(); } catch(Exception e){}
          if(ps != null) try { ps.close(); } catch(Exception e){}
          if(conn != null) try { conn.close(); } catch(Exception e){}
      }
    %>
     <%
	    if (session.getAttribute("user") == null) {
	        response.sendRedirect("login.jsp");
	    }
	%>
  </tbody>
</table>

</body>
</html>