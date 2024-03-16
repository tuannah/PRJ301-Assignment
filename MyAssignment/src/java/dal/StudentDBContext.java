/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Lecturer;
import entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt
 */
public class StudentDBContext extends DBContext<Student> {

    @Override
    public ArrayList<Student> list() {
           ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select sid, sname FROM Student";
         
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("sid"));
                student.setName(rs.getString("sname"));
                students.add(student);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
  return students ;
    }
  

}
