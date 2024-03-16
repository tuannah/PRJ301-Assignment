
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<style>
    table {
        border-collapse: collapse;
        width: 80%;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #3498db;
    }

    /*tr:nth-child(even) {
        background-color: #f2f2f2;
    }*/

    tr:hover {
        background-color: #ddd;
    }


    input[type=date], input[type=submit] {
        padding: -6px;
        margin: 5px;
        border-radius: 14px;
    }

    .container {
        text-align: center;
        margin-top: 40px;
    }

    .timetable-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .head{
        background-color: #3498db;
    }
    .timetable-wrapper {
        overflow-x: auto;
        width: 100%;
    }

    img {
        vertical-align: middle;
        border-style: none;
        width: 36%;
    }

    @media screen and (max-width: 600px) {
        table, thead, tbody, th, td, tr {
            display: block;
        }

        thead tr {
            position: absolute;
            top: -9999px;
            left: -9999px;

            background-color: #3498db;
            color: white;

        }

        tr {
            border: 1px solid #ccc;
        }

        td {
            border: none;
            border-bottom: 1px solid #eee;
            position: relative;
            padding-left: 50%;
        }


        td:before {
            position: absolute;
            top: 6px;
            left: 6px;
            width: 45%;
            padding-right: 10px;
            white-space: nowrap;
        }

        td:nth-of-type(1):before {
            content: "MON";
        }
        td:nth-of-type(2):before {
            content: "TUE";
        }
        td:nth-of-type(3):before {
            content: "WED";
        }
        td:nth-of-type(4):before {
            content: "THU";
        }
        td:nth-of-type(5):before {
            content: "FRI";
        }
        td:nth-of-type(6):before {
            content: "SAT";
        }
        td:nth-of-type(7):before {
            content: "SUN";
        }
    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
    String[] daysOfWeek = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
    request.setAttribute("daysOfWeek", daysOfWeek);
        %>
    </head>
    <body>
        <div style="margin-left: 86%">
            <a href="/MyAssignment/logout">
                <img src="https://cdn1.vieclam24h.vn/upload/files_cua_nguoi_dung/logo/2019/05/08/1557278478_Logo_i_hc_FPT.png" alt="Logout">

            </a>
        </div>

        <div style="display: flex; justify-content: center; align-items: center; margin-top: 2%;">
            <table border="2px">
                <thead>
                    <tr>
                        <th rowspan="2">
                            <div style="text-align: center; margin-top: 40px">
                                <form action="timetable" method="GET">
                                    <input type="hidden" name="id" value="${param.id}"/>
                                    From: <input type="date" name="from" value="${requestScope.from}" /></br>
                                    To: <input type="date" name="to" value="${requestScope.to}"/>
                                    <input type="submit" value="View" style="background-color: coral"/>
                                </form>
                            </div>
                        </th>
                    </tr>

                     <tr>
                
                
                <c:forEach items="${requestScope.dates}" var="d">
                    <th>
                [<fmt:formatDate pattern="EEEE" value="${d}"/>]</br>
                        ${d}</th>
                </c:forEach>
            </tr>
                </thead>

                <tbody>
                    <c:forEach items="${requestScope.slots}" var="slot">
                        <tr>
                            <td>${slot.name}</td>
                            <c:forEach items="${requestScope.dates}" var="d">
                                <td>
                                    <c:forEach items="${requestScope.lessions}" var="les">
                                        <c:if test="${(les.date eq d) and (les.slot.id eq slot.id)}">
                                            ${les.group.name} </br>
                                            ${les.group.subject.name}</br>
                                            <a> at </a>${les.room.name}
                                            <a href="att?id=${les.id}">
                                                <c:if test="${les.attended}">
                                                    <span style="color: green;">(Attendance)</span>
                                                </c:if>
                                                <c:if test="${!les.attended}">
                                                    (Not yet)
                                                </c:if>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


            </br>

        </div>
    </div>
</body>
</html>
