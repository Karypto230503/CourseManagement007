<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.riyad.User, com.riyad.CourseDAO, java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"teacher".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    List<User> students = (List<User>) request.getAttribute("students");
    int courseId = (Integer) request.getAttribute("courseId");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Course Management System</a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">Welcome, <%= user.getFullName() %></span>
                <a class="btn btn-outline-light btn-sm" href="teacherDashboard.jsp">Back to Dashboard</a>
                <a class="btn btn-outline-light btn-sm ms-2" href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="mb-4">Students Enrolled in Course</h2>
        
        <div class="card">
            <div class="card-header bg-info text-white">
                <h5 class="card-title mb-0">Student List</h5>
            </div>
            <div class="card-body">
                <% if (students.isEmpty()) { %>
                    <p class="text-muted">No students enrolled in this course yet.</p>
                <% } else { %>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Student ID</th>
                                    <th>Full Name</th>
                                    <th>Username</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (User student : students) { %>
                                    <tr>
                                        <td><%= student.getId() %></td>
                                        <td><%= student.getFullName() %></td>
                                        <td><%= student.getUsername() %></td>
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