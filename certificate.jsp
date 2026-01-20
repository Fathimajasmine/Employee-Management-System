<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String type = request.getParameter("type");
    String name = request.getParameter("name");
    String designation = request.getParameter("designation");

    if (type == null || name == null || designation == null) {
        out.println("<h2>Invalid Certificate Details</h2>");
        return;
    }

    String title = "";
    String message = "";

    switch(type) {

        case "experience":
            title = "EXPERIENCE CERTIFICATE"; 
            message = "This is to certify that <b>" + name +
                      "</b> worked with our organization as <b>" + designation +
                      "</b>. During his tenure, he fulfilled his responsibilities with sincerity, professionalism, and commitment. " +
                      "We appreciate his contribution and wish him success in all his future endeavors.";
            break;

        case "best":
            title = "BEST PERFORMER AWARD"; 
            message = "This certificate is proudly awarded to <b>" + name +
                      "</b> in recognition of outstanding performance and dedication to work. " +
                      "His consistent efforts and excellence have significantly contributed to the success of the organization.";
            break;

        case "employee":
            title = "EMPLOYEE OF THE YEAR"; 
            message = "This certificate is presented to <b>" + name +
                      "</b> for being selected as Employee of the Year. " +
                      "His exceptional performance and dedication have set a benchmark for excellence.";
            break;

        case "long":
            title = "LONG SERVICE AWARD"; 
            message = "This certificate is awarded to <b>" + name +
                      "</b> in recognition of his loyal and long-term service to the organization. " +
                      "We sincerely appreciate his valuable contribution.";
            break;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Employee Certificate</title>

<style>
body{
    background:#eef1f5;
    font-family:"Times New Roman", serif;
}

.certificate{
    width:85%;
    margin:40px auto;
    padding:50px 60px;
    background:#fff;
    border:12px solid transparent;
    border-image:linear-gradient(45deg, #d4af37, #b8962e) 1;
    position:relative;
    box-shadow:0 25px 50px rgba(0,0,0,0.25);
}

/* ===== HEADER ===== */
.header{
    text-align:center;
    margin-bottom:30px;
}

.company-row{
    display:flex;
    flex-direction:column;   /* LOGO TOP */
    align-items:center;
    justify-content:center;
    gap:10px;
}

.company-logo{
    width:110px;
    height:auto;
}

.company{
    font-size:26px;
    font-weight:bold;
    color:#8b6b1f;
    letter-spacing:1px;
}

.tagline{
    font-size:14px;
    color:#777;
}

/* ===== WATERMARK ===== */
.watermark{
    position:absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    font-size:120px;
    font-weight:bold;
    letter-spacing:8px;
    color:#000;
    opacity:0.04;
    user-select:none;
}

/* ===== CONTENT ===== */
.content{
    position:relative;
    z-index:2;
    text-align:center;
}

h1{
    font-size:36px;
    letter-spacing:2px;
    margin:30px 0;
}

.message{
    font-size:20px;
    line-height:1.8;
    margin:0 40px;
}

/* ===== FOOTER ===== */
.footer{
    margin-top:70px;
    display:flex;
    justify-content:space-between;
    font-size:16px;
}

.sign{
    font-family:"Brush Script MT", cursive;
    font-size:26px;
}

/* ===== SEAL ===== */
.seal{
    position:absolute;
    right:60px;
    bottom:120px;
    width:90px;
    height:90px;
    border:4px solid #c59d3c;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
    color:#c59d3c;
}

/* ===== PRINT ===== */
@media print{
    button, a { display:none; }
    body{ background:white; }
}
</style>
</head>

<body>

<div class="certificate">

    <div class="watermark">CERTIFIED</div>

    <!-- HEADER WITH LOGO ON TOP -->
    <div class="header">
        <div class="company-row">
            <img src="<%=request.getContextPath()%>/images/logo.png" 
                 class="company-logo" alt="ABC Logo">
            <div class="company">ABC Technologies Pvt Ltd</div>
            <div class="tagline">Innovating Excellence</div>
        </div>
    </div>

    <!-- CERTIFICATE CONTENT -->
    <div class="content">
        <h1><%=title%></h1>
        <p class="message"><%=message%></p>

        <div class="footer">
            <div>
                Date:<br>
                <%= java.time.LocalDate.now() %>
            </div>

            <div style="text-align:right;">
                Authorized Signatory<br>
                <span class="sign">Fathima Jasmine M</span><br>
                <small>Project Admin</small>
            </div>
        </div>
    </div>

    <div class="seal">OFFICIAL</div>
</div>

<center>
    <a href="viewEmployee.jsp">View Employees</a> |
    <a href="index.jsp">⬅ Back to Home</a>
    <br><br>
    <button onclick="window.print()">🖨 Print Certificate</button>
</center>

</body>
</html>
