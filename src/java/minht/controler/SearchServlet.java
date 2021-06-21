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
import minht.roles.RoleDAO;
import minht.roles.RoleDTO;
import minht.user.UserDAO;
import minht.user.UserDTO;

/**
 *
 * @author MinhT
 */
public class SearchServlet extends HttpServlet {
private  String SUCCESS= "Search.jsp";
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
        String url= SUCCESS;
    try {
        RoleDAO roleDAO = new RoleDAO();
        UserDAO userDAO= new UserDAO();
        String nameSearch = request.getParameter("nameSearch");
        String roleName = request.getParameter("roleName");
         if (nameSearch == null) {
                nameSearch = "";
            }
            if (roleName == null || roleName.equals("ALL")) {
                roleName = "";
                request.setAttribute("roleName", "ALL");
            } else {
                request.setAttribute("roleName", roleName);
            }
            ArrayList<RoleDTO> listRole;
    
        listRole = roleDAO.getListRole();
        ArrayList<UserDTO> listUser = userDAO.getAllUserFilter(nameSearch, roleName);
            listRole.add(new RoleDTO(0, "ALL"));
            request.setAttribute("listUser", listUser);
            request.setAttribute("listRole", listRole);
            request.setAttribute("nameSearch", nameSearch);
    } catch (NamingException ex) {
        Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
        Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
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
