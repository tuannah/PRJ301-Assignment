<%-- 
    Document   : viewstudent
    Created on : Mar 11, 2024, 8:54:33 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Two Forms Example</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: white;
            }
            img {
                vertical-align: middle;
                border-style: none;
                width: 10%;
                margin-left:100%;
            }
            .form-container {
                margin: 20px;
                display: inline-block;
            }

            form {
                text-align: center;
            }

            button[type="submit"] {
                padding: 40px 60px;
                background-color: #ff7a00;
                color: #fff;
                border: none;
                border-radius: 10%;
                cursor: pointer;
                font-size: 16px;
            }

            button[type="submit"]:hover {
                background-color: #0056b3;
            }

            .app-links {
                position: absolute;
                top: 19px;
                left: 78%;
                transform: translateX(-50%);
            }

            .app-links a {
                margin: 20px;
            }

            /* Thiết lập vị trí tuyệt đối cho thẻ table */
            table {
                position: absolute;
                top: 20px;
                left: 1%;
            }
            h1{
                color:green;
            }
        </style>
    </head>
    
    <body>
        <table>
            <tbody>
            <h1>Choose one</h1></br>
                <tr>
                    <td>
                        <a href="/MyAssignment/logout">
                            <img src="https://cdn1.vieclam24h.vn/upload/files_cua_nguoi_dung/logo/2019/05/08/1557278478_Logo_i_hc_FPT.png" alt="Logout">
                        </a>
                    </td>
                </tr>

            </tbody>
        </table>

        <div class="form-container">
            <form action="student" method="post">
                <button type="submit" name="action" value="timetable">Timetable</button>
            </form>
        </div>

        <div class="form-container">
            <form action="processForm2.jsp" method="post">
                <button type="submit" name="action" value="mark">Mark Report</button>
            </form>
        </div>

    </body>
</html>

