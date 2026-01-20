<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Search Employee</title>

    <style>
        body{
            font-family: Arial;
            background:#121212;
            color:white;
            padding:30px;
        }
        h2{text-align:center;}
        .box{
            width:400px;
            margin:auto;
            background:#1e1e1e;
            padding:20px;
            border-radius:10px;
            text-align:center;
        }
        input{
            width:100%;
            padding:10px;
            margin:10px 0;
            background:#2c2c2c;
            color:white;
            border:1px solid #555;
            border-radius:5px;
        }
        input[type=submit]{
            background:#007BFF;
            border:none;
            font-weight:bold;
            cursor:pointer;
        }
        table{
            width:95%;
            margin:30px auto;
            border-collapse:collapse;
            background:#1e1e1e;
        }
        th,td{
            padding:10px;
            text-align:center;
        }
        th{background:#007BFF;}
        tr:nth-child(even){background:#2a2a2a;}
    </style>
</head>

<body>

<h2>Search Employee by ID</h2>

<div class="box">
    <form>
        <input type="number" name="id" placeholder="Enter Employee ID" required>
        <input type="submit" value="Search">
    </form>
</div>

<%
String idParam = request.getParameter("id");

if(idParam != null){
    try{
        int id = Integer.parseInt(idParam);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost/employee_db","root","fathima2005");

        String sql = "SELECT * FROM employee WHERE emp_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
%>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Department</th>
    <th>Designation</th>
    <th>Salary</th>
    <th>Gender</th>
    <th>Date of Joining</th>
</tr>

<tr>
    <td><%=rs.getInt("emp_id")%></td>
    <td><%=rs.getString("emp_name")%></td>
    <td><%=rs.getString("emp_email")%></td>
    <td><%=rs.getString("emp_phone")%></td>
    <td><%=rs.getString("emp_department")%></td>
    <td><%=rs.getString("emp_designation")%></td>
    <td><%=rs.getDouble("emp_salary")%></td>
    <td><%=rs.getString("emp_gender")%></td>
    <td><%=rs.getString("emp_doj")%></td>
</tr>
</table>

<%
        } else {
            out.println("<p style='text-align:center;color:red;'>Employee not found</p>");
        }

        rs.close();
        ps.close();
        con.close();

    }catch(Exception e){
        out.println("<p style='color:red;text-align:center;'>"+e.getMessage()+"</p>");
    }
}
%>

<p style="text-align:center;">
    <a href="viewEmployee.jsp">View Employees</a> |
    <a href="index.jsp">⬅ Back to Home</a>
</p>

</body>
</html>
