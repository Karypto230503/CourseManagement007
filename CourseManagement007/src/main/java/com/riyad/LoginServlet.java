package com.riyad;


import com.riyad.UserDAO;
import com.riyad.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UserDAO userDAO = new UserDAO();
        User user = userDAO.authenticateUser(username, password);
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            switch(user.getRole()) {
                case "admin":
                    response.sendRedirect("adminDashboard.jsp");
                    break;
                case "teacher":
                    response.sendRedirect("teacherDashboard.jsp");
                    break;
                case "student":
                    response.sendRedirect("studentDashboard.jsp");
                    break;
                default:
                    response.sendRedirect("login.jsp?error=Invalid role");
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid credentials");
        }
    }
}
