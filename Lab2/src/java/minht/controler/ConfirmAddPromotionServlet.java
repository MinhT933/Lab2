/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.controler;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import minht.containter.MyConstants;
import minht.history.HistoryDAO;
import minht.history.HistoryDTO;
import minht.promotion.PromotionDAO;
import minht.promotion.PromotionDTO;
import minht.rank.RankDTO;
import minht.status.StatusDAO;
import minht.status.StatusDTO;

/**
 *
 * @author MinhT
 */
public class ConfirmAddPromotionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            response.setContentType("text/html;charset=UTF-8");
            String namePromotion = request.getParameter("namePromotion");
            String userID = request.getParameter("userID");
            HistoryDAO Hdao = new HistoryDAO();
            boolean flag = Hdao.checkHistory(userID);
            if (!flag) {
                PromotionDAO promotionDAO = new PromotionDAO();
                StatusDAO statusDAO = new StatusDAO();
                RankDAO rankDAO = new RankDAO();
                ArrayList<PromotionDTO> listPromotion = promotionDAO.getViewListPromotion();
                Date assignDate = Date.valueOf(java.time.LocalDate.now());
                ArrayList<StatusDTO> listStatus = statusDAO.getListStatus();
                ArrayList<RankDTO> listRank = rankDAO.getListRank();
                PromotionDTO itemAddPro = null;
                for (PromotionDTO promotionDTO : listPromotion) {
                    if (promotionDTO.getPromotionName().equals(namePromotion)) {
                        itemAddPro = new PromotionDTO(promotionDTO.getPromotionID(), promotionDTO.getPromotionName());
                    }
                }
                StatusDTO addStatus = null;
                for (StatusDTO status : listStatus) {
                    if (status.getStatusID() == MyConstants.STATUS_ID_ACTIVE) {
                        addStatus = new StatusDTO(status.getStatusID(), status.getStatusName());
                        break;
                    }
                }
                RankDTO addRankDTO = null;
                for (RankDTO rank : listRank) {
                    if (rank.getRankID() == MyConstants.RANK_ID_DEFAULT) {
                        addRankDTO = new RankDTO(rank.getRankID(), rank.getRankValue());
                        break;
                    }
                }
                boolean isAdd = Hdao.insertHistory(new HistoryDTO(userID, assignDate, itemAddPro, addStatus, addRankDTO));
                request.setAttribute("addSuccess", "add success full");
                request.setAttribute("userID", userID);
            } else {
                request.setAttribute("addFail", "add fail ");
            }
            request.setAttribute("namePromotion", namePromotion);
        } catch (NamingException ex) {
            Logger.getLogger(ConfirmAddPromotionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConfirmAddPromotionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher("AddPromotionServlet").forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
