<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;

            
            background: url("<%= request.getContextPath() %>/images/employees.jpg");
            background-size: cover;
            background-position: center;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            width: 430px;
            padding: 35px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.4);
        }

        h2 {
            margin-bottom: 5px;
            color: #0f4c75;
            font-weight: 600;
        }

        .subtitle {
            font-size: 14px;
            color: #666;
            margin-bottom: 25px;
        }

        .menu a {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin: 14px 0;
            padding: 13px;
            background: linear-gradient(135deg, #14b8a6, #0f766e);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .menu a:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 10px 25px rgba(20, 184, 166, 0.6);
        }

        footer {
            margin-top: 22px;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Employee Management System</h2>
    <div class="subtitle">Admin Panel</div>

    <div class="menu">
        <a href="addEmployee.jsp">👤➕ Add Employee</a>
        <a href="viewEmployee.jsp">👥 View Employees</a>
        <a href="updateEmployee.jsp">✏️ Update Employees</a>
        <a href="deleteEmployee.jsp">🗑 Delete Employees</a>
        <a href="searchEmployee.jsp">🔍 Search Employees</a>
    </div>
</div>

</body>
</html>
