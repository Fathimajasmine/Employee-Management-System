<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
<%@page import="java.time.temporal.ChronoUnit"%>

<!DOCTYPE html>
<html>
<head>
    <title>View Employees</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212; /* dark grey */
            margin: 0;
            padding: 30px;
            color: #ffffff;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .table-container {
            display: flex;
            justify-content: center;
        }

        table {
            border-collapse: collapse;
            width: 95%;
            max-width: 1200px;
            background-color: #1e1e1e;
            box-shadow: 0 0 15px rgba(0,0,0,0.6);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 10px 12px;
            text-align: center;
        }

        th {
            background-color: #007BFF;
            color: #ffffff;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #2a2a2a;
        }

        tr:nth-child(odd) {
            background-color: #242424;
        }

        tr:hover {
            background-color: #333333;
        }

        td {
            color: #e0e0e0;
        }

        a {
            text-decoration: none;
            color: #4da3ff;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }

        .links {
            text-align: center;
            margin-top: 25px;
        }
    </style>
</head>

<body>

<h2>Employee List</h2>

<div class="table-container">
<table>
<tr>
    <th>Id</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Department</th>
    <th>Designation</th>
    <th>Salary</th>
    <th>Gender</th>
    <th>Date of Joining</th>
    <th>Certificate</th> 
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost/employee_db","root","fathima2005");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM employee");

    while(rs.next()) {
        String name = rs.getString("emp_name");
        String designation = rs.getString("emp_designation");
        double salary = rs.getDouble("emp_salary");
        LocalDate doj = LocalDate.parse(rs.getString("emp_doj"));
        LocalDate today = LocalDate.now();
        long years = ChronoUnit.YEARS.between(doj, today);
%>

<tr>
    <td><%= rs.getString("emp_id") %></td>
    <td><%= name %></td>
    <td><%= rs.getString("emp_email") %></td>
    <td><%= rs.getString("emp_phone") %></td>
    <td><%= rs.getString("emp_department") %></td>
    <td><%= designation %></td>
    <td><%= salary %></td>
    <td><%= rs.getString("emp_gender") %></td>
    <td><%= rs.getString("emp_doj") %></td>
    <td>
        <% if(years >= 1){ %>
            <a href="certificate.jsp?type=experience&name=<%=name%>&designation=<%=designation%>">Experience</a><br>
        <% } %>

        <% if(salary >= 45000){ %>
            <a href="certificate.jsp?type=best&name=<%=name%>&designation=<%=designation%>">Best Performer</a><br>
        <% } %>

        <% if(salary >= 50000){ %>
            <a href="certificate.jsp?type=employee&name=<%=name%>&designation=<%=designation%>">Employee of the Year</a><br>
        <% } %>

        <% if(years >= 5){ %>
            <a href="certificate.jsp?type=long&name=<%=name%>&designation=<%=designation%>">Long Service</a>
        <% } %>
    </td>
</tr>

<%
    }
    rs.close();
    st.close();
    con.close();
} catch(Exception e) {
    out.println(e.getMessage());
}
%>

</table>
</div>

<div class="links">
    <a href="addEmployee.jsp">➕ Add New Employee</a> |
    <a href="index.jsp">⬅ Back to Home</a>
</div>

</body>
</html>
