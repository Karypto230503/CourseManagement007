package com.riyad;


import com.riyad.CourseDAO;
import com.riyad.Course;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String courseCode = request.getParameter("courseCode");
        String courseName = request.getParameter("courseName");
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        
        Course course = new Course();
        course.setCourseCode(courseCode);
        course.setCourseName(courseName);
        course.setTeacherId(teacherId);
        
        CourseDAO courseDAO = new CourseDAO();
        boolean success = courseDAO.addCourse(course);
        
        if (success) {
            response.sendRedirect("adminDashboard.jsp?message=Course added successfully");
        } else {
            response.sendRedirect("adminDashboard.jsp?error=Failed to add course");
        }
    }
}
