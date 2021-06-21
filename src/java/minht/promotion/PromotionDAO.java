/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.promotion;

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
public class PromotionDAO {

    private PreparedStatement pstm = null;
    private Connection cn = null;
    private ResultSet rs = null;

    public ArrayList<PromotionDTO> getViewListPromotion() throws SQLException {
        ArrayList<PromotionDTO> list = new ArrayList<PromotionDTO>();
        
        try {
            String sql = "SELECT [promotionID]\n"
                + "      ,[promotionName]\n"
                + "  FROM [UserManagement].[dbo].[Promotions]";
            cn= DBHelper.getConnection();
            if(cn!=null){
            pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    list.add((new PromotionDTO(rs.getInt(1), rs.getString(2))));
                }
        }
        } catch(Exception e){
            
        }finally{
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
         return list;
    }
   
}
