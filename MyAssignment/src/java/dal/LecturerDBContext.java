/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Lecturer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO
 */
public class LecturerDBContext extends DBContext<Lecturer>{

    @Override
    public ArrayList<Lecturer> list() {
        ArrayList<Lecturer> lecturers = new ArrayList<>();

        try {
            String sql = "select lid, lname FROM Lecturer";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lecturer lecturer = new Lecturer();
                lecturer.setId(rs.getInt("lid"));
                lecturer.setName(rs.getString("lname"));
                lecturers.add(lecturer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeSlotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lecturers;

    }
    
}
