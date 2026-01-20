<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #121212; /* DARK GREY background */
        display: flex;
        justify-content: center;
        padding: 20px 0;
        margin: 0;
    }

    .container {
        background-color: #1e1e1e; /* dark grey container */
        color: #ffffff; /* white text */
        padding: 25px 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.6);
        width: 400px;
    }

    h2 {
        text-align: center;
        color: #ffffff;
        margin-bottom: 20px;
    }

    form input, form select {
        width: 100%;
        padding: 8px 10px;
        margin: 6px 0 12px 0;
        border: 1px solid #555;
        border-radius: 5px;
        background-color: #2c2c2c; /* dark input */
        color: #ffffff;
        box-sizing: border-box;
    }

    form input::placeholder {
        color: #aaaaaa;
    }

    input[type="submit"] {
        background-color: #007BFF;
        color: white;
        font-weight: bold;
        border: none;
        cursor: pointer;
        padding: 10px;
        border-radius: 5px;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    a {
        text-decoration: none;
        color: #4da3ff;
    }

    .links {
        text-align: center;
        margin-top: 12px;
    }
</style>


</head>
<body>

<div class="container">
    <h2>Add Employee</h2>

    <form method="post">
        Name: <input type="text" name="name" required>
        Email: <input type="email" name="email" required>
        Phone: <input type="text" name="phone" required>
        Department: <input type="text" name="dept" required>
        Designation: <input type="text" name="desig" required>
        Salary: <input type="number" name="salary" required>
        Gender:
        <select name="gender" required>
            <option value="">Select</option>
            <option>Male</option>
            <option>Female</option>
        </select>
        Date of Joining: <input type="date" name="doj" required>

        <input type="submit" value="Add Employee">
    </form>

    <hr>

    <%
    try {
        if(request.getParameter("name") != null) {
            String name   = request.getParameter("name");
            String email  = request.getParameter("email");
            String phone  = request.getParameter("phone");
            String dept   = request.getParameter("dept");
            String desig  = request.getParameter("desig");
            double salary = Double.parseDouble(request.getParameter("salary"));
            String gender = request.getParameter("gender");
            String doj    = request.getParameter("doj");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee_db","root","fathima2005");

            String sql = "INSERT INTO employee " +
                         "(emp_name, emp_email, emp_phone, emp_department, emp_designation, emp_salary, emp_gender, emp_doj) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, dept);
            ps.setString(5, desig);
            ps.setDouble(6, salary);
            ps.setString(7, gender);
            ps.setString(8, doj);

            int result = ps.executeUpdate();

            if(result > 0){
                out.println("<h3 style='color:green; text-align:center;'>Employee added successfully!</h3>");
                out.println("<div class='links'><a href='viewEmployee.jsp'>View Employees</a></div>");
            }

            ps.close();
            con.close();
        }
    } catch(Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    }
    %>

    <div class="links">
        <a href="viewEmployee.jsp" style="color:white;">View Employees</a><br><br>
        <a href="index.jsp" style="color:#007BFF;">⬅ Back to Home</a>
    </div>
</div>

</body>
</html>
