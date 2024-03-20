package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "eventCompleted", urlPatterns = {"/eventCompleted"})
public class EventCompleted extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            int id = Integer.parseInt(request.getParameter("userid"));
            Registration reg = new Registration(session);
            String status = reg.eventDone(id);
            if (status.equals("success")) {
                
                request.setAttribute("status","Succesfully moved to complted events");
                request.getRequestDispatcher("Booking.jsp").forward(request, response);
            }
            if (status.equals("failure")) {
                
                 request.setAttribute("status","move failure");
                response.sendRedirect("Booking.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
