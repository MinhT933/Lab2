/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.roles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import minht.connect.DBHelper;

/**
 *
 * @author MinhT
 */
public class RoleDAO {

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

    public ArrayList<RoleDTO> getListRole() throws NamingException, SQLException {
        ArrayList<RoleDTO> list = new ArrayList<>();
        try {
            cn = DBHelper.getConnection();
            if (cn != null) {
                String sql = "SELECT [roleID]\n"
                        + "      ,[roleName]\n"
                        + "  FROM [UserManagement].[dbo].[Roles]";
                pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    list.add(new RoleDTO(rs.getInt("roleID"), rs.getString("roleName")));
                }
            }
        } finally {
            close();
        }
        return list;
    }
}
