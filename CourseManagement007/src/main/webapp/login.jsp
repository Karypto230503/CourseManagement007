<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Course Management Website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white text-center">
                        <h3>Course Management Website</h3>
                    </div>
                    <div class="card-body">
                        <% if (request.getParameter("error") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getParameter("error") %>
                            </div>
                        <% } %>
                        <% if (request.getParameter("message") != null) { %>
                            <div class="alert alert-success" role="alert">
                                <%= request.getParameter("message") %>
                            </div>
                        <% } %>
                        
                        <form action="login" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Login</button>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <small>Don't have an account? <a href="register.jsp">Register here</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>