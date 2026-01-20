<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #121212; /* dark grey background */
    }

    .container {
        text-align: center;
        margin: 50px auto;
        padding: 30px;
        background-color: #1e1e1e; /* dark container */
        width: 400px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0,0,0,0.6);
        color: #ffffff;
    }

    input[type="text"] {
        padding: 8px;
        width: 80%;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #555;
        background-color: #2c2c2c;
        color: #ffffff;
    }

    input[type="text"]::placeholder {
        color: #aaaaaa;
    }

    input[type="submit"] {
        padding: 8px 20px;
        border-radius: 5px;
        border: none;
        background-color: #007BFF;
        color: white;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    a {
        text-decoration: none;
        color: #4da3ff;
        margin: 0 5px;
    }

    a:hover {
        text-decoration: underline;
    }

    h2, h3 {
        margin-bottom: 20px;
        color: #ffffff;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Delete Employee</h2>

        <form method="get" action="deleteEmployee.jsp">
            <input type="text" name="id" placeholder="Enter Employee ID" required><br>
            <input type="submit" value="Delete">
        </form>

        <%
            String idParam = request.getParameter("id");

            if(idParam != null && !idParam.isEmpty()) {
                try {
                    int id = Integer.parseInt(idParam);

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employee_db","root","fathima2005");

                    String sql = "DELETE FROM employee WHERE emp_id=?";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setInt(1, id);

                    int rows = ps.executeUpdate();
                    if(rows > 0) {
                        out.println("<h3>Employee record deleted successfully!</h3>");
                    } else {
                        out.println("<h3>No employee found with ID: " + id + "</h3>");
                    }

                    ps.close();
                    con.close();

                } catch(NumberFormatException nfe) {
                    out.println("<h3>Invalid ID format!</h3>");
                } catch(Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                }
            }
        %>

        <div style="margin-top: 20px;">
            <a href="viewEmployee.jsp">View Employees</a> | 
            <a href="index.jsp">⬅ Back to Home</a>
        </div>
    </div>
</body>
</html>
