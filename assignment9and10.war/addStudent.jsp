<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            display: flex;
            /* justify-content: center; */
            flex-direction: column;
            align-items: center;
        }

        nav {
            width: 100%;
            height: 50px;

            display: flex;

        }

        nav>button {

            width: auto;
            height: 30px;
            padding: 0 15px;
        }

        nav>button>a {
            text-decoration: none;

        }

        .form {
            height: auto;
            width: 50%;
            margin-top: 100px;
            display: flex;
            flex-direction: column;
        }

        .form>fieldset>form {
            display: flex;
            flex-direction: column;
            padding: 10px;
        }
    </style>
</head>

<body>

    <nav>
        <button><a href="addStudent.jsp">Add Student</a></button>
        <button><a href="display.jsp">Display Students</a></button>
        <button><a href="logout.jsp">logout</a></button>
    </nav>

    <div class="form">
        <fieldset>
            <legend>Student Registration Form</legend>

            <form action="addStudent.jsp" method="post">
            	<div class="id">id: <input type="number" name="id" placeholder="Enter your course" max="100"
                        min="10"></div>
                <div class="name">Name: <input type="text" name="name" placeholder="Enter name"></div>
                <div class="email"> Email: <input type="email" name="email" placeholder="Enter email"></div>
                <div class="course">Course: <input type="text" name="course" placeholder="Enter your course"></div>
                <div class="age">Age: <input type="number" name="age" placeholder="Enter your course" max="100"
                        min="10"></div>
                <div class="cgpa"> CGPA: <input type="number" name="cgpa" placeholder="Enter your cgpa" max="10"
                        min="1"></div>

                <div class="sub">
                    <input type="submit" value="Go" name="submit">
                </div>
            </form>
        </fieldset>
    </div>
    
    <%
    	int id=40;
	    String name = "dfdf";
	    String email = "dsfsdf";
	    String course = "sdfsf";
	    int age = 15;
	    int cgpa = 5;
	    if(request.getParameter("submit") != null){
	  		try{
	  			id = Integer.parseInt(request.getParameter("id"));
	  			name = request.getParameter("name");
	  			email = request.getParameter("email");
	  			course = request.getParameter("course");
	  			age = Integer.parseInt(request.getParameter("age"));
	  			cgpa = Integer.parseInt(request.getParameter("cgpa"));
	  		}
	  		catch(Exception e){
	  			out.println(e);
	  		}
	  	}

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Load PostgreSQL driver
            Class.forName("org.postgresql.Driver");

            // Connect to your database
            conn = DriverManager.getConnection(
                "jdbc:postgresql://192.168.1.17/cse_db24", 
                "24bcsb08", 
                "24bcsb08"
            );

            // SQL Insert query
            String sql = "INSERT INTO student3 ( id,name, email, course, age, cgpa) VALUES (?,?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, course);
            ps.setInt(5, age);
            ps.setInt(6, cgpa);

            int rows = ps.executeUpdate();

            if(rows > 0){
                out.println("<h3>Student added successfully!</h3>");
            } else {
                out.println("<h3>Failed </h3>");
            }

        } catch(Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if(ps != null) try { ps.close(); } catch(Exception e){}
            if(conn != null) try { conn.close(); } catch(Exception e){}
        }
    %>
     <%
	    if (session.getAttribute("user") == null) {
	        response.sendRedirect("login.jsp");
	    }
	%>

</body>

</html>