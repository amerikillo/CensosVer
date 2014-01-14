/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import conn.*;// package que contiene la Clase ConectionDBS
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wence
 */
@WebServlet(name = "GuardaSeccion", urlPatterns = {"/GuardaSeccion"})
public class GuardaSeccion extends HttpServlet {

    ConectionDB con = new ConectionDB();

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuardaSeccion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardaSeccion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
        //processRequest(request, response);

        HttpSession sesion = request.getSession(true);
        PrintWriter out = response.getWriter();

        try {
            con.conectar();
            if (request.getParameter("guarda_seccion").equals("A")) {
                out.println("Hola");
                String qry = "update tb_a set  ";
                for (int i = 1; i < 28; i++) {
                    qry = qry + "campo_"+i+"='"+request.getParameter("campo_"+i)+"', ";
                }
                qry = qry + " campo_28='"+request.getParameter("campo_28")+"' where campo_4 = '"+request.getParameter("campo_4")+"' ;";
                con.actualizar(qry);
                response.sendRedirect("capturaCensosH.jsp");
            }
            
            if (request.getParameter("guarda_seccion").equals("B")) {
                out.println("Hola");
                String qry = "update tb_b set  ";
                for (int i = 29; i < 33; i++) {
                    qry = qry + "campo_"+i+"='"+request.getParameter("campo_"+i)+"', ";
                }
                qry = qry + " campo_33='"+request.getParameter("campo_33")+"' where campo_4 = '"+request.getParameter("campo_4")+"' ;";
                out.println(qry);
                con.actualizar(qry);
                response.sendRedirect("capturaCensosH.jsp");
            }
            
            if (request.getParameter("guarda_seccion").equals("C")) {
                out.println("Hola");
                String qry = "update tb_c set  ";
                for (int i = 34; i < 40; i++) {
                    qry = qry + "campo_"+i+"='"+request.getParameter("campo_"+i)+"', ";
                }
                qry = qry + " campo_40='"+request.getParameter("campo_40")+"' where campo_4 = '"+request.getParameter("campo_4")+"' ;";
                con.actualizar(qry);
                response.sendRedirect("capturaCensosH.jsp");
            }
            
            if (request.getParameter("guarda_seccion").equals("D")) {
                out.println("Hola");
                String qry = "update tb_d set  ";
                for (int i = 41; i < 43; i++) {
                    qry = qry + "campo_"+i+"='"+request.getParameter("campo_"+i)+"', ";
                }
                qry = qry + " campo_43='"+request.getParameter("campo_43")+"' where campo_4 = '"+request.getParameter("campo_4")+"' ;";
                con.actualizar(qry);
                response.sendRedirect("capturaCensosH.jsp");
            }
            
            if (request.getParameter("guarda_seccion").equals("E")) {
                out.println("Hola");
                String qry = "update tb_e set  ";
                for (int i = 44; i < 96; i++) {
                    qry = qry + "campo_"+i+"='"+request.getParameter("campo_"+i)+"', ";
                }
                qry = qry + " campo_96='"+request.getParameter("campo_96")+"' where campo_4 = '"+request.getParameter("campo_4")+"' ;";
                con.actualizar(qry);
                response.sendRedirect("capturaCensosH.jsp");
            }
            
            if (request.getParameter("guarda_seccion").equals("F")) {
                out.println("Hola");
                String qry = "update tb_f set  ";
                for (int i = 97; i < 150; i++) {
                    qry = qry + "campo_"+i+"='"+request.getParameter("campo_"+i)+"', ";
                }
                qry = qry + " campo_150='"+request.getParameter("campo_150")+"' where campo_4 = '"+request.getParameter("campo_4")+"' ;";
                con.actualizar(qry);
                response.sendRedirect("capturaCensosH.jsp");
            }
            
            if (request.getParameter("guarda_seccion").equals("G")) {
                out.println("Hola");
                String qry = "update tb_g set  campo_151='"+request.getParameter("campo_151")+"' where campo_4 = '"+request.getParameter("campo_4")+"' ;";
                con.actualizar(qry);
                response.sendRedirect("capturaCensosH.jsp");
            }
            con.cierraConexion();
        } catch (SQLException e) {
            try {
                con.cierraConexion();
            } catch (SQLException ex) {
                Logger.getLogger(GuardaSeccion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }// end of doPost

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
