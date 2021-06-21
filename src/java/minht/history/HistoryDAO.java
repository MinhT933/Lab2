/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.history;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import minht.connect.DBHelper;
import minht.containter.MyConstants;
import minht.promotion.PromotionDTO;
import minht.rank.RankDTO;
import minht.status.StatusDTO;

/**
 *
 * @author MinhT
 */
public class HistoryDAO {

    private PreparedStatement pstm = null;
    private Connection cn = null;
    private ResultSet rs = null;

    public ArrayList<HistoryDTO> getAllListHistory(String userID) throws SQLException, NamingException {
        HistoryDTO history = null;
        ArrayList<HistoryDTO> listHistory = new ArrayList<>();
        try {
            cn = DBHelper.getConnection();
            if (cn != null) {
                String sql = "select userID, p.promotionID, promotionName,  h.assignDate, s.statusID, statusName, r.rankID, r.rankValue from Histories h, Promotions p, Status s, Ranks r \n"
                        + "where h.statusID = s.statusID and h.rankID = r.rankID and p.promotionID = h.promotionID and userID = ? order by h.assignDate DESC";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, userID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    history = new HistoryDTO(rs.getString("userID"), rs.getDate("assignDate"), new PromotionDTO(rs.getInt("promotionID"), rs.getString("promotionName")), new StatusDTO(rs.getInt("statusID"), rs.getString("statusName")), new RankDTO(rs.getInt("rankID"), rs.getInt("rankValue")));
                    listHistory.add(history);
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
        }
        return listHistory;
    }

    public boolean checkHistory(String userID) throws NamingException, SQLException {
        boolean flag = false;
        try {
            cn = DBHelper.getConnection();
            if (cn != null) {
                String sql = "select userID from Histories where userID = ? and statusID = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, userID);
                pstm.setInt(2, MyConstants.STATUS_ID_ACTIVE);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    flag = rs.getString("userID").isEmpty() ? false : true;
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

        }
        return flag;

    }

    public boolean insertHistory(HistoryDTO history) throws SQLException, NamingException {
        boolean flag = false;
        try {
            cn = DBHelper.getConnection();
            if (cn != null) {
                String sql = "insert into Histories values (?,?,?,?,?)";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, history.getUserID());
                pstm.setInt(2, history.getRankDTO().getRankID());
                pstm.setDate(3, history.getAssignDate());
                pstm.setInt(4, history.getPromotionDTO().getPromotionID());
                pstm.setInt(5, history.getStatusDTO().getStatusID());
                flag = pstm.executeUpdate() > 0 ? true : false;
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
        }
        return flag;
    }
     public boolean updateStatusHistory(String userID, int statusUpdate) throws NamingException, SQLException {
        boolean flag = false;
        try {
            cn = DBHelper.getConnection();
            if (cn != null) {
                String sql = "Update Histories SET statusID = ? where userID = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, statusUpdate);
                pstm.setString(2, userID);
                flag = pstm.executeUpdate() > 0 ? true : false;
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
        }
        return flag;
    }

    public HistoryDTO getDetailHistory(String userID, int statusUpdate) throws NamingException, SQLException {
        HistoryDTO history = null;
        try {
            cn = DBHelper.getConnection();
            if (cn != null) {
                String sql = "select userID, p.promotionID, promotionName,  h.assignDate, s.statusID, statusName, r.rankID, r.rankValue from Histories h, Promotions p, Status s, Ranks r \n"
                        + "where h.statusID = s.statusID and h.rankID = r.rankID and p.promotionID = h.promotionID and userID = ? and h.statusID = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, userID);
                pstm.setInt(2, statusUpdate);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    history = new HistoryDTO(rs.getString("userID"), rs.getDate("assignDate"), new PromotionDTO(rs.getInt("promotionID"), rs.getString("promotionName")), new StatusDTO(rs.getInt("statusID"), rs.getString("statusName")), new RankDTO(rs.getInt("rankID"), rs.getInt("rankValue")));
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
        }
        return history;
    }
         public boolean checkHistory(HistoryDTO historyDTO) throws NamingException, SQLException {
        try {
            cn = DBHelper.getConnection();
            String sql = "select userID from Histories where (promotionID != ? or rankID != ?) and userID = ? and statusID = ? ";
            pstm = cn.prepareStatement(sql);
            pstm.setInt(1, historyDTO.getPromotionDTO().getPromotionID());
            pstm.setInt(2, historyDTO.getRankDTO().getRankID());
            pstm.setString(3, historyDTO.getUserID());
            pstm.setInt(4, historyDTO.getStatusDTO().getStatusID());
            rs = pstm.executeQuery();
            if (rs.next()) {
                return true;
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
        }
        return false;
    }

    public ArrayList<HistoryDTO> getListHistoryByPromotionID(int promotionID) throws NamingException, SQLException {
      HistoryDTO history = null;
        ArrayList<HistoryDTO> listHistory = new ArrayList<>();
        try {
            cn = DBHelper.getConnection();
            if (cn != null) {
                String sql = "select u.userID, p.promotionID, p.promotionName, s.statusID, s.statusName, r.rankID, r.rankValue, h.assignDate from Histories h, Promotions p, Status s, Ranks r, Users u \n"
                        + "where h.promotionID =p.promotionID and h.userID = u.userID and r.rankID = h.rankID and h.statusID = s.statusID \n"
                        + "and p.promotionID = ? order by h.assignDate DESC";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, promotionID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    history = new HistoryDTO(rs.getString("userID"), rs.getDate("assignDate"), new PromotionDTO(rs.getInt("promotionID"), rs.getString("promotionName")), new StatusDTO(rs.getInt("statusID"), rs.getString("statusName")), new RankDTO(rs.getInt("rankID"), rs.getInt("rankValue")));
                    listHistory.add(history);
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
        }
        return listHistory;
    }
    

    }


