<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
</head>
<body>
    <h2>All Students</h2>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>SIC No</th>
        </tr>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        String driver = "org.postgresql.Driver";
        String url = "jdbc:postgresql://192.168.1.17:5432/cse_db24";        String password = "24bc";

        Class.forName(driver);
        con = DriverManager.getConnection(url, username, password);

        String qry = "SELECT * FROM student";
        stmt = con.createStatement();
        rs = stmt.executeQuery(qry);

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("sic") %></td>
        </tr>
<%
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(con != null) con.close();
    }
%>
    </table>
</body>
</html>
