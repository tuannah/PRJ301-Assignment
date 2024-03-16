<%-- 
    Document   : att
    Created on : Mar 1, 2024, 1:54:23 PM
    Author     : sonnt
--%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    /* Reset CSS for default styling */
* {
    margin-top: 20px;
    padding: 0;
    box-sizing: border-box;
}

input[type=submit] {
    padding: 8px;
    margin: 5px;
    border-radius: 14px;
    margin-left: 110%;
}

/* Style for the table */
table {
    width: 130%;
    border-collapse: collapse;
}

/* Style for table header */
th {
    background-color: #f2f2f2;
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

/* Style for table cells */
td {
    border: 1px solid #dddddd;
    padding: 8px;
}
th{
    background-color:#f2750a ;
    color: white;
}
/* Style for even rows */
tr:nth-child(even) {
    background-color: #f9f9f9;
}

/* Style for odd rows */
tr:nth-child(odd) {
    background-color: #ffffff;
}

/* Style for input[type="radio"] */
input[type="radio"] {
    margin-right: 5px;
}

/* Style for input[type="text"] */
input[type="text"] {
    width: 90%;
    padding: 5px;
    border: 1px solid #8b9b39;
    border-radius: 9px;
}

</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="display: flex; margin-left:10%; align-items: center;">
        <form action="att" method="POST">
            <input type="hidden" name="id" value="${param.id}" />
            <table border="1px">
                <tr>                    
                    <th>Id</th>
                    <th>Name</th>
                    <th>Presented</th>
                    <th>Note</th>
                    <th>Time</th>               
                </tr>
                <c:forEach items="${requestScope.atts}" var="a">
                <tr>
                    <td>${a.student.id}</td>
                    <td>${a.student.name}</td>
                    <td>
                        <input type="radio" 
                               ${!a.present?"checked=\"checked\"":""}
                               name="present${a.student.id}" value="no"/> No
                        <input type="radio" 
                               ${a.present?"checked=\"checked\"":""}
                               name="present${a.student.id}" value="yes"/> Yes
                    </td>
                    <td>
                        <input type="text" name="description${a.student.id}" value="${a.description}"/>
                    </td>
                    <td>${a.time}</td>
                </tr>    
                </c:forEach>
            </table>
            <input type="submit" value="Save" style="background-color: chartreuse"/>
        </form>
            </div>
    </body>
</html>
