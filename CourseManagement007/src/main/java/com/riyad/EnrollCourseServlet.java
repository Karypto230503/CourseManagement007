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

@WebServlet("/enrollCourse")
public class EnrollCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        int studentId = user.getId();
        
        CourseDAO courseDAO = new CourseDAO();
        boolean success = courseDAO.enrollCourse(studentId, courseId);
        
        if (success) {
            response.sendRedirect("studentDashboard.jsp?message=Course enrolled successfully");
        } else {
            response.sendRedirect("studentDashboard.jsp?error=Failed to enroll course");
        }
    }
}
