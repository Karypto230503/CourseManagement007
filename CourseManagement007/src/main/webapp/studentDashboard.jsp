<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.riyad.User, com.riyad.CourseDAO, com.riyad.Course, java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    CourseDAO courseDAO = new CourseDAO();
    List<Course> enrolledCourses = courseDAO.getCoursesByStudentId(user.getId());
    List<Course> availableCourses = courseDAO.getAvailableCourses(user.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
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
        <h2 class="mb-4">Student Dashboard</h2>
        
        <% if (request.getParameter("message") != null) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= request.getParameter("message") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= request.getParameter("error") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>
        
        <div class="row">
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header bg-success text-white">
                        <h5 class="card-title mb-0">Available Courses</h5>
                    </div>
                    <div class="card-body">
                        <% if (availableCourses.isEmpty()) { %>
                            <p class="text-muted">No available courses to enroll.</p>
                        <% } else { %>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Teacher</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Course course : availableCourses) { %>
                                            <tr>
                                                <td><%= course.getCourseCode() %></td>
                                                <td><%= course.getCourseName() %></td>
                                                <td><%= course.getTeacherName() != null ? course.getTeacherName() : "Not Assigned" %></td>
                                                <td>
                                                    <form action="enrollCourse" method="post">
                                                        <input type="hidden" name="courseId" value="<%= course.getId() %>">
                                                        <button type="submit" class="btn btn-sm btn-primary">Enroll</button>
                                                    </form>
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
            
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h5 class="card-title mb-0">My Enrolled Courses</h5>
                    </div>
                    <div class="card-body">
                        <% if (enrolledCourses.isEmpty()) { %>
                            <p class="text-muted">You haven't enrolled in any courses yet.</p>
                        <% } else { %>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Teacher</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Course course : enrolledCourses) { %>
                                            <tr>
                                                <td><%= course.getCourseCode() %></td>
                                                <td><%= course.getCourseName() %></td>
                                                <td><%= course.getTeacherName() != null ? course.getTeacherName() : "Not Assigned" %></td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>