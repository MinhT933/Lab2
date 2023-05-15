/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.controler;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import minht.history.HistoryDAO;
import minht.promotion.PromotionDAO;
import minht.promotion.PromotionDTO;

/**
 *
 * @author MinhT
 */
public class AddPromotionServlet extends HttpServlet {
    private String INSERT_PROMOTION="InsertPromotion.jsp";
    private String FAIL_SEND_NOTIFICATION="SearchServlet";

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
        String url = "";
        try {
            response.setContentType("text/html;charset=UTF-8");
            String userID = request.getParameter("userID");
            PromotionDAO Pdao= new PromotionDAO();
            HistoryDAO Hdao= new HistoryDAO();
            boolean flag= Hdao.checkHistory(userID);
            if(!flag){
                ArrayList<PromotionDTO> listPromotion = Pdao.getViewListPromotion();
                request.setAttribute("listPromotion", listPromotion);
                request.setAttribute("userID", userID);
                url=INSERT_PROMOTION;
            }else{
                url = FAIL_SEND_NOTIFICATION;
                request.setAttribute("mess", "each user only one promotion");
                request.setAttribute("userID", userID);
            }
        } catch (NamingException ex) {
            Logger.getLogger(AddPromotionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddPromotionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
