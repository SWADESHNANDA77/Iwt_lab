<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f0f2f5;
      display: flex;
      justify-content: center;

    }
    .container {
      background: #fff;
      padding: 30px;
      border-radius: 8px;

    }
    h2 {
      text-align: center;
      margin-bottom: 30px;
    }
    input[type="text"], input[type="password"], input[type="email"] {
      width: 100%;
      padding: 10px;
  
    }
    button {
      width: 100%;
      padding: 10px;

  
    }
    button:hover {
      background: #0056b3;
    }
    .toggle-link {
      display: block;
      text-align: center;

    }
    .form {
      display: none;
    }
    .form.active {
      display: block;
    }
  </style>
</head>
<body>
  <div class="container">
    <!-- Login Form -->
    <div id="loginForm" class="form active">
      <h2>Login</h2>
      <form method="POST" action="login.jsp">
        <input type="text" name="username" placeholder="enter your username" required>
        <input type="password" name="password" placeholder="enter password"required>
        <button type="submit">Login</button>
      </form>
    </div>
  
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
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
                // Login: check credentials
                String sql = "SELECT * FROM users WHERE username=? AND password=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);
                rs = ps.executeQuery();

                if (rs.next()) {
                    session.setAttribute("user", username);
                    response.sendRedirect("addStudent.jsp");
                } else {
                    out.println("<p>Invalid login. Try again.</p>");
                }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    }
%>

</body>
</html>