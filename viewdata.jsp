<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Employee</title>
</head>
<body>

<h2>Edit Employee</h2>
<form> <input type="text" name="id" placeholder="Id">
        <input type="submit" value="login">
    </form>


<%
    int id = Integer.parseInt(request.getParameter("id"));

    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employee_db","root","fathima2005");

        String sql = "SELECT * FROM employee WHERE emp_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            id = rs.getInt("emp_id");
           
        }

        rs.close();
        ps.close();
        con.close();
    } catch(Exception e) {
        out.println(e.getMessage());
    }
%>

<form action="updateEmployee.jsp" method="post">
    
    Id: <input type="text" name="id" value="<%=id%>"><br><br>

    
    <input type="submit" value="Update Employee">
</form>

</body>
</html>
