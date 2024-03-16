/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDBContext;
import dal.LecturerDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Lecturer;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Cookie;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 *
 * @author LENOVO
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AccountDBContext db = new AccountDBContext();
        Account account = db.getByUsernamePassword(username, password);
        LecturerDBContext lect = new LecturerDBContext();
        ArrayList<Lecturer> lecturers = lect.list();
        StudentDBContext stu = new StudentDBContext();
        ArrayList<Student> students = stu.list();
        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);

            Cookie c_user = new Cookie("username", username);
            Cookie c_pass = new Cookie("password", password);
            c_user.setMaxAge(3600 * 24 * 7);
            c_pass.setMaxAge(3600 * 24 * 7);
            response.addCookie(c_pass);
            response.addCookie(c_user);

            int lidUse = -1; // Giá trị mặc định
            for (Lecturer lecturer : lecturers) {
                if (lecturer.getName().equals(account.getUsername())) { // Thay "getLecturerName()" bằng phương thức lấy tên giảng viên từ đối tượng Account
                    lidUse = lecturer.getId();
                    break;
                }
            }
            session.setAttribute("lidUse", lidUse);
           
            
            int sidUse = -1; 
            for (Student student : students) {
                if (student.getName().equals(account.getUsername())) { // Thay "getLecturerName()" bằng phương thức lấy tên giảng viên từ đối tượng Account
                    sidUse = student.getId();
                    break;
                }
            }
            session.setAttribute("sidUse", sidUse);
            
            if (lidUse != -1  ) {
                session.setAttribute("account", account);
                response.sendRedirect("lecturer/timetable?id=" + lidUse);
            } else {
                response.sendRedirect("/MyAssignment/student");
            }
        } else {
         String error = "Username or Password is wrong";
         request.setAttribute("error", error);
         request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }

}
