<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.riyad.User, com.riyad.CourseDAO, com.riyad.Course, java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    CourseDAO courseDAO = new CourseDAO();
    List<Course> courses = courseDAO.getAllCourses();
    List<User> teachers = courseDAO.getAllTeachers();
    List<User> students = courseDAO.getAllStudents() ;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .dashboard-card {
            transition: transform 0.3s;
            height: 100%;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
        .nav-pills .nav-link.active {
            background-color: #0d6efd;
        }
        .stat-card {
            border-left: 4px solid #0d6efd;
        }
        .table-hover tbody tr:hover {
            background-color: rgba(13, 110, 253, 0.1);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="home.jsp">
                <i class="fas fa-graduation-cap me-2"></i>Course Management System
            </a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">Welcome, <%= user.getFullName() %></span>
                <a class="btn btn-outline-light btn-sm" href="home.jsp">Home</a>
                <a class="btn btn-outline-light btn-sm ms-2" href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="mb-4">Admin Dashboard</h2>
        
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
        
        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card stat-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <h5 class="card-title">Total Courses</h5>
                                <h2 class="text-primary"><%= courses.size() %></h2>
                            </div>
                            <div class="flex-shrink-0">
                                <i class="fas fa-book fa-2x text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card stat-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <h5 class="card-title">Total Teachers</h5>
                                <h2 class="text-success"><%= teachers.size() %></h2>
                            </div>
                            <div class="flex-shrink-0">
                                <i class="fas fa-chalkboard-teacher fa-2x text-success"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card stat-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <h5 class="card-title">Total Students</h5>
                                <h2 class="text-info"><%= students.size() %></h2>
                            </div>
                            <div class="flex-shrink-0">
                                <i class="fas fa-user-graduate fa-2x text-info"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navigation Tabs -->
        <ul class="nav nav-pills mb-4" id="adminTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="add-course-tab" data-bs-toggle="pill" data-bs-target="#add-course" type="button" role="tab">
                    <i class="fas fa-plus-circle me-1"></i>Add Course
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="courses-tab" data-bs-toggle="pill" data-bs-target="#courses" type="button" role="tab">
                    <i class="fas fa-book me-1"></i>All Courses
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="teachers-tab" data-bs-toggle="pill" data-bs-target="#teachers" type="button" role="tab">
                    <i class="fas fa-chalkboard-teacher me-1"></i>All Teachers
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="students-tab" data-bs-toggle="pill" data-bs-target="#students" type="button" role="tab">
                    <i class="fas fa-user-graduate me-1"></i>All Students
                </button>
            </li>
        </ul>

        <!-- Tab Content -->
        <div class="tab-content" id="adminTabsContent">
            <!-- Add Course Tab -->
            <div class="tab-pane fade show active" id="add-course" role="tabpanel">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title mb-0">Add New Course</h5>
                    </div>
                    <div class="card-body">
                        <form action="addCourse" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="courseCode" class="form-label">Course Code</label>
                                    <input type="text" class="form-control" id="courseCode" name="courseCode" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="courseName" class="form-label">Course Name</label>
                                    <input type="text" class="form-control" id="courseName" name="courseName" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="teacherId" class="form-label">Assign Teacher</label>
                                <select class="form-select" id="teacherId" name="teacherId" required>
                                    <option value="">Select Teacher</option>
                                    <% for (User teacher : teachers) { %>
                                        <option value="<%= teacher.getId() %>"><%= teacher.getFullName() %> (<%= teacher.getEmail() %>)</option>
                                    <% } %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-plus me-1"></i>Add Course
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- All Courses Tab -->
            <div class="tab-pane fade" id="courses" role="tabpanel">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h5 class="card-title mb-0">All Courses</h5>
                    </div>
                    <div class="card-body">
                        <% if (courses.isEmpty()) { %>
                            <div class="text-center py-4">
                                <i class="fas fa-book fa-3x text-muted mb-3"></i>
                                <p class="text-muted">No courses available.</p>
                            </div>
                        <% } else { %>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Teacher</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Course course : courses) { %>
                                            <tr>
                                                <td><strong><%= course.getCourseCode() %></strong></td>
                                                <td><%= course.getCourseName() %></td>
                                                <td>
                                                    <% if (course.getTeacherName() != null) { %>
                                                        <%= course.getTeacherName() %>
                                                    <% } else { %>
                                                        <span class="text-danger">Not Assigned</span>
                                                    <% } %>
                                                </td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </button>
                                                    <button class="btn btn-sm btn-outline-danger">
                                                        <i class="fas fa-trash"></i> Delete
                                                    </button>
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

            <!-- All Teachers Tab -->
            <div class="tab-pane fade" id="teachers" role="tabpanel">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h5 class="card-title mb-0">All Teachers</h5>
                    </div>
                    <div class="card-body">
                        <% if (teachers.isEmpty()) { %>
                            <div class="text-center py-4">
                                <i class="fas fa-chalkboard-teacher fa-3x text-muted mb-3"></i>
                                <p class="text-muted">No teachers registered.</p>
                            </div>
                        <% } else { %>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Full Name</th>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (User teacher : teachers) { %>
                                            <tr>
                                                <td><%= teacher.getId() %></td>
                                                <td><strong><%= teacher.getFullName() %></strong></td>
                                                <td><%= teacher.getUsername() %></td>
                                                <td><%= teacher.getEmail() %></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-info">
                                                        <i class="fas fa-eye"></i> View
                                                    </button>
                                                    <button class="btn btn-sm btn-outline-warning">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </button>
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

            <!-- All Students Tab -->
            <div class="tab-pane fade" id="students" role="tabpanel">
                <div class="card">
                    <div class="card-header bg-warning text-dark">
                        <h5 class="card-title mb-0">All Students</h5>
                    </div>
                    <div class="card-body">
                        <% if (students.isEmpty()) { %>
                            <div class="text-center py-4">
                                <i class="fas fa-user-graduate fa-3x text-muted mb-3"></i>
                                <p class="text-muted">No students registered.</p>
                            </div>
                        <% } else { %>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Full Name</th>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (User student : students) { %>
                                            <tr>
                                                <td><%= student.getId() %></td>
                                                <td><strong><%= student.getFullName() %></strong></td>
                                                <td><%= student.getUsername() %></td>
                                                <td><%= student.getEmail() %></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-info">
                                                        <i class="fas fa-eye"></i> View
                                                    </button>
                                                    <button class="btn btn-sm btn-outline-warning">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </button>
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
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Activate the tab from URL hash
        document.addEventListener('DOMContentLoaded', function() {
            const hash = window.location.hash;
            if (hash) {
                const tabTrigger = document.querySelector(`[data-bs-target="${hash}"]`);
                if (tabTrigger) {
                    new bootstrap.Tab(tabTrigger).show();
                }
            }
            
            // Store tab state in URL
            const tabEls = document.querySelectorAll('button[data-bs-toggle="pill"]');
            tabEls.forEach(tabEl => {
                tabEl.addEventListener('shown.bs.tab', function(event) {
                    window.location.hash = event.target.getAttribute('data-bs-target');
                });
            });
        });
    </script>
</body>
</html>