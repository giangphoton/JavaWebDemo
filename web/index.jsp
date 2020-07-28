<jsp:include page="header.html"/>
<%@ page import="business.User" %>
<%
    // get attributes from the request
    User user = (User) request.getAttribute("user");
    String message
            = (String) request.getAttribute("message");

    // handle null values
    if (user == null) {
        user = new User();
    }
    if (message == null) {
        message = "";
    }

    // SESSION: check if email logged in or not
    String s_email = (String) session.getAttribute("email");
    if (s_email == null || s_email == "") {
        s_email = "Not Logged";
    }
    
    // COOKIE: check if email logged in or not
//    Cookie[] cookies = request.getCookies();
//    String cookieName = "email";
//    String c_email = "";
////    for (int i = 0; i < cookies.length; i++){
////        Cookie cookie = cookies[i];
////        if (cookieName.equals(cookie.getName())) {
////            c_email = cookie.getValue();
////        }
////    }
//    if (c_email == null || c_email == "") {
//        c_email = "Not Logged";
//    }

%>

<h1>Join our email list</h1>
<!--SHOW SESSION UI-->
<p>Your email address stored in session: <%= s_email %> </p>
<!--SHOW COOKIES UI-->
<!--<p>Your email address stored in cookies <%= c_email %> </p>-->

<p>To join our email list, enter your name and
    email address below. <br>
    Then, click on the Submit button.</p>
<p><i><%= message%></i></p>
<form action="AddToEmailListServlet" method="post">
    <table cellspacing="5" border="0">
        <tr>
            <td align="right">First name:</td>
            <td><input type="text" name="firstName" value="<%= user.getFirstName()%>"> </td
            </td>
        </tr>
        <tr>
            <td align="right">Last name:</td>
            <td><input type="text" name="lastName" value="<%= user.getLastName()%>"> </td>
        <tr>
            <td align="right">Email address:</td>
            <td><input type="text" name="emailAddress" value="<%= user.getEmailAddress()%>"> 
            </td>
        </tr>
        <tr>
            <td></td>
            <td><br>
                <input type="submit" value="Submit" ></td>
        </tr>
    </table>
</form>	
<jsp:include page="footer.jsp"/>