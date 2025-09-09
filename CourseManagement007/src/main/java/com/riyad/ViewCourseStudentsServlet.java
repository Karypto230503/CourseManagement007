package com.riyad;


import com.riyad.CourseDAO;
import com.riyad.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/viewCourseStudents")
public class ViewCourseStudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null || !"teacher".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        
        CourseDAO courseDAO = new CourseDAO();
        request.setAttribute("students", courseDAO.getStudentsByCourseId(courseId));
        request.setAttribute("courseId", courseId);
        
        request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
    }
}