<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212; /* dark grey background */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #1e1e1e;
            color: #ffffff;
            padding: 30px;
            width: 420px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.6);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            border-radius: 5px;
            border: 1px solid #555;
            background-color: #2c2c2c;
            color: #ffffff;
        }

        input::placeholder {
            color: #aaaaaa;
        }

        input[type="submit"] {
            padding: 10px 25px;
            border-radius: 5px;
            border: none;
            background-color: #007BFF;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .links {
            margin-top: 15px;
        }

        a {
            text-decoration: none;
            color: #4da3ff;
            margin: 0 5px;
        }

        a:hover {
            text-decoration: underline;
        }

        .success {
            color: #4CAF50;
            margin-top: 15px;
            font-weight: bold;
        }

        .error {
            color: #ff5252;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Update Employee</h2>

    <form method="get">
        <input type="text" name="id" placeholder="Employee ID" required>
        <input type="text" name="name" placeholder="Employee Name">
        <input type="text" name="email" placeholder="Email">
        <input type="text" name="phone" placeholder="Phone">
        <input type="submit" value="Update">
    </form>

<%
    String idParam = request.getParameter("id");

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost/employee_db","root","fathima2005");

            String sql = "UPDATE employee SET emp_name=?, emp_email=?, emp_phone=? WHERE emp_id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setInt(4, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                out.println("<div class='success'>Employee record updated successfully!</div>");
            } else {
                out.println("<div class='error'>Employee ID not found!</div>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            out.println("<div class='error'>Error: " + e.getMessage() + "</div>");
        }
    }
%>

    <div class="links">
        <a href="viewEmployee.jsp">View Employees</a> |
        <a href="index.jsp">⬅ Back to Home</a>
    </div>
</div>

</body>
</html>
