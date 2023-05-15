/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.controler;

import java.io.IOException;
import java.nio.file.Paths;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import minht.hashpass.HashPass;
import minht.roles.RoleDAO;
import minht.roles.RoleDTO;
import minht.user.UserDAO;
import minht.user.UserDTO;
import minht.user.UsersError;

/**
 *
 * @author MinhT
 */
public class UpdateServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
     try {
            response.setContentType("text/html;charset=UTF-8");

            String userName = request.getParameter("userName");
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            Part filePart = request.getPart("photo");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            boolean flag = false;
            RoleDAO roleDAO = new RoleDAO();
            ArrayList<RoleDTO> listRole = roleDAO.getListRole();
            request.setAttribute("listRole", listRole);
            UsersError usersError = new UsersError("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
            if (userName.trim().isEmpty()) {
                flag = true;
                usersError.setErrorName("user name is empty");
            }
            if (!userName.trim().isEmpty() && !userName.matches("[a-z A-Z]+")) {
                flag = true;
                usersError.setErrorNameFormat("user name must only letter");
            }
            if (!userName.trim().isEmpty() && userName.length() < 1 || userName.length() > 50) {
                flag = true;
                usersError.setErrorNameLength("user name length 1-> 50");
            }
            if (password.trim().isEmpty()) {
                flag = true;
                usersError.setErrorPassword("password is empty");
            }
            if (!password.trim().isEmpty() && password.length() < 1 || password.length() > 50) {
                flag = true;
                usersError.setErrorPasswordLength("password must only length 1 -> 50");
            }

            if (email.trim().isEmpty()) {
                flag = true;
                usersError.setErrorEmail("email is empty");
            }
            if (!email.trim().isEmpty() && !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                flag = true;
                usersError.setErrorEmailFormat("email is invalid Format abc@gmail.com");
            }
            if (email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$") && email.length() > 50) {
                flag = true;
                usersError.setErrorEmailLength("email must length less than 50 letter");
            }

            if (phone.trim().isEmpty()) {
                flag = true;
                usersError.setErrorPhone("phone is empty");
            }
            if (!phone.trim().isEmpty() && phone.trim().length() < 1 || phone.trim().length() > 12) {
                flag = true;
                usersError.setErrorPhoneLength("phone must length 10 | 11 number");
            }
            if (!phone.trim().isEmpty() && !phone.matches("[0-9]{9}")) {
                flag = true;
                usersError.setErrorPhoneFormat("phone must number");
            }
            if (fileName.isEmpty()) {
                flag = true;
                usersError.setErrorPhoto("photo is empty");
            }
            UserDTO userUpdate = new UserDTO(userID, userName, password, email, phone, "", null, null);
            for (RoleDTO roleDTO : listRole) {
                if (roleDTO.getRoleName().equals(role)) {
                    userUpdate.setRoleDTO(roleDTO);
                    break;
                }
            }
            String imgUrl = null;
            String hashPassWord = null;
            UserDAO usersDAO = new UserDAO();
            if (flag) {
                request.setAttribute("userUpdate", userUpdate);
                request.setAttribute("errorUser", usersError);
            } else {
                if (fileName.contains(".jpg")) {
                    imgUrl = HashPass.writeImage(request, userID, filePart, ".jpg");
                    try {
                        hashPassWord = HashPass.bytesToHex(password);
                    } catch (NoSuchAlgorithmException ex) {
                        log(ex.getMessage());
                    }
                    userUpdate.setPhoto(imgUrl);
                    userUpdate.setPassword(hashPassWord);
                    boolean updateUser = usersDAO.updateUser(userUpdate);
                    if (updateUser) {
                        request.setAttribute("updateSuccess", "Update SuccessFully");
                    }
                } else if (fileName.contains(".jpeg")) {
                    imgUrl = HashPass.writeImage(request, userID, filePart, ".jpeg");
                    try {
                        hashPassWord = HashPass.bytesToHex(password);
                    } catch (NoSuchAlgorithmException ex) {
                        log(ex.getMessage());
                    }
                    userUpdate.setPhoto(imgUrl);
                    userUpdate.setPassword(hashPassWord);
                    boolean updateUser = usersDAO.updateUser(userUpdate);
                    if (updateUser) {
                        request.setAttribute("updateSuccess", "Update SuccessFully");
                    }
                } else {
                    request.setAttribute("errorFormat", "Error Format File Must JPG && JPEG");
                }
            }
        } catch (NamingException ex) {
            log(ex.getMessage());
        } catch (SQLException ex) {
            log(ex.getMessage());
        } finally {
            request.getRequestDispatcher("update.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
