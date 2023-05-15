/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.status;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import minht.connect.DBHelper;

/**
 *
 * @author MinhT
 */
public class StatusDAO {
    private PreparedStatement pstm = null;
    private Connection cn = null;
    private ResultSet rs = null;

    public ArrayList<StatusDTO> getListStatus() throws SQLException {
  
    
     ArrayList<StatusDTO> list = new ArrayList<>();
        try {
            cn = DBHelper.getConnection();
            if (cn != null) {
                String sql = "select statusID, statusName from Status";
                pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {                    
                    list.add(new StatusDTO(rs.getInt("statusID"), rs.getString("statusName")));
                }
            }
        } finally {
           if (pstm != null) {
            pstm.close();
        }
        if (cn != null) {
            cn.close();
        }
        if (rs != null) {
            rs.close();
        }
        return list;
    }
    
}
}
