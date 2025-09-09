<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.riyad.User, com.riyad.CourseDAO, com.riyad.Course, java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"teacher".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    CourseDAO courseDAO = new CourseDAO();
    List<Course> courses = courseDAO.getCoursesByTeacherId(user.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Course Management System</a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">Welcome, <%= user.getFullName() %></span>
                <a class="btn btn-outline-light btn-sm" href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="mb-4">Teacher Dashboard</h2>
        
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">My Courses</h5>
            </div>
            <div class="card-body">
                <% if (courses.isEmpty()) { %>
                    <p class="text-muted">You don't have any assigned courses.</p>
                <% } else { %>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Course Code</th>
                                    <th>Course Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Course course : courses) { %>
                                    <tr>
                                        <td><%= course.getCourseCode() %></td>
                                        <td><%= course.getCourseName() %></td>
                                        <td>
                                            <a href="viewCourseStudents?courseId=<%= course.getId() %>" 
                                               class="btn btn-sm btn-info">View Students</a>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <% } %>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>