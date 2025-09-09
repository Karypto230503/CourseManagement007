<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Course Management Website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .role-card {
            transition: all 0.3s;
            cursor: pointer;
            border: 2px solid transparent;
        }
        .role-card:hover, .role-card.selected {
            border-color: #0d6efd;
            transform: translateY(-5px);
        }
        .role-card.selected {
            background-color: rgba(13, 110, 253, 0.1);
        }
        .role-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow">
                    <div class="card-header bg-success text-white text-center">
                        <h3><i class="fas fa-user-plus me-2"></i>Create New Account</h3>
                    </div>
                    <div class="card-body">
                        <% if (request.getParameter("error") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i><%= request.getParameter("error") %>
                            </div>
                        <% } %>
                        
                        <form action="register" method="post" id="registrationForm">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="username" class="form-label">Username *</label>
                                    <input type="text" class="form-control" id="username" name="username" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">Email Address *</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="password" class="form-label">Password *</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                    <div class="form-text">Must be at least 6 characters long</div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="fullName" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName">
                                </div>
                            </div>
                            
                            <!-- Role Selection -->
                            <div class="mb-4">
                                <label class="form-label">Select Your Role *</label>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <div class="card role-card text-center h-100" id="studentCard" onclick="selectRole('student')">
                                            <div class="card-body">
                                                <div class="role-icon text-primary">
                                                    <i class="fas fa-user-graduate"></i>
                                                </div>
                                                <h5 class="card-title">Student</h5>
                                                <p class="card-text">Enroll in courses and track your learning progress</p>
                                                <input type="radio" class="btn-check" name="role" id="roleStudent" value="student" autocomplete="off" required>
                                                <label class="btn btn-outline-primary" for="roleStudent">Select Student</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="card role-card text-center h-100" id="teacherCard" onclick="selectRole('teacher')">
                                            <div class="card-body">
                                                <div class="role-icon text-success">
                                                    <i class="fas fa-chalkboard-teacher"></i>
                                                </div>
                                                <h5 class="card-title">Teacher</h5>
                                                <p class="card-text">Create and manage courses, track student progress</p>
                                                <input type="radio" class="btn-check" name="role" id="roleTeacher" value="teacher" autocomplete="off">
                                                <label class="btn btn-outline-success" for="roleTeacher">Select Teacher</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success btn-lg">
                                    <i class="fas fa-user-plus me-2"></i>Create Account
                                </button>
                                <a href="login.jsp" class="btn btn-outline-secondary">
                                    <i class="fas fa-sign-in-alt me-2"></i>Back to Login
                                </a>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <small>Already have an account? <a href="login.jsp">Login here</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function selectRole(role) {
            // Update card visuals
            document.querySelectorAll('.role-card').forEach(card => {
                card.classList.remove('selected');
            });
            
            if (role === 'student') {
                document.getElementById('studentCard').classList.add('selected');
                document.getElementById('roleStudent').checked = true;
            } else {
                document.getElementById('teacherCard').classList.add('selected');
                document.getElementById('roleTeacher').checked = true;
            }
        }
        
        // Form validation
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const roleSelected = document.querySelector('input[name="role"]:checked');
            
            if (password.length < 6) {
                e.preventDefault();
                alert('Password must be at least 6 characters long');
                return false;
            }
            
            if (!roleSelected) {
                e.preventDefault();
                alert('Please select your role');
                return false;
            }
        });
    </script>
</body>
</html>