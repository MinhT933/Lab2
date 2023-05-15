/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.controler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import minht.connect.DBHelper;
import minht.rank.RankDTO;

/**
 *
 * @author MinhT
 */
 public class RankDAO {

   private PreparedStatement pstm = null;
    private Connection cn = null;
    private ResultSet rs = null;

    public void close() throws SQLException {
        if (pstm != null) {
            pstm.close();
        }
        if (cn != null) {
            cn.close();
        }
        if (rs != null) {
            rs.close();
        }
    }

    public ArrayList<RankDTO> getListRank() throws NamingException, SQLException {
        ArrayList<RankDTO> list = new ArrayList<>();
        try {
            cn = DBHelper.getConnection();
            if (cn != null) {
                String sql = "select rankID, rankValue from Ranks";
                pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    list.add(new RankDTO(rs.getInt("rankID"), rs.getInt("rankValue")));
                }
            }
        } finally {
            close();
        }
        return list;
    }
    
}
