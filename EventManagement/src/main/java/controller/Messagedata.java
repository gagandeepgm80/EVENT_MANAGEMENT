package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Message;
import model.Registration;

@WebServlet(name = "Messagedata", urlPatterns = { "/Messagedata" })

public class Messagedata extends HttpServlet {
	protected void processRequest(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // type of the response sent to the client or browser
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Message reg = new Message(session);
        try {if (request.getParameter("mess") != null) {
            String name = request.getParameter("fullname");
            String phone = request.getParameter("mobileno");
            String email = request.getParameter("emailid");
            String pw = request.getParameter("description");
     
            if (1==1) {
                String status = reg.sendinfo(name, phone, email, pw);

                if (status.equals("existed")) {
                    request.setAttribute("status", "You have reached your limit");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                } else if (status.equals("success")) {
                    request.setAttribute("status", "We have received your message we'll reach you soon");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Message sent failed");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                }
            }
            }
        }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
	
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    processRequest(request, response);
}

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    processRequest(request, response);
}

public String getServletInfo() {
    return "Short description";
}// </editor-fold>
}
