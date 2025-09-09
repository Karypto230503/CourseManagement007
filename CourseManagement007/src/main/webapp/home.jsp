<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management Website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #4e73df;
            --secondary: #6f42c1;
            --success: #1cc88a;
            --light: #f8f9fc;
            --dark: #5a5c69;
        }
        
        /* Fixed navbar always black */
        .navbar {
            background-color: #000 !important;
            padding: 12px 0;
        }
        
        /* Carousel positioned correctly below navbar */
        .carousel-container {
            margin-top: 76px; /* Height of navbar */
        }
        
        .carousel-item {
            /* height: 500px; */
            height: 80vh;
            overflow: hidden;
        }
        .carousel-item img {
            object-fit: cover;
            width: 100%;
            height: 100%;
        }
        .carousel-caption {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 10px;
            bottom: 30%;
            animation: fadeIn 1.5s ease-in-out;
        }
        .carousel-control-prev, .carousel-control-next {
            width: 5%;
        }
        .carousel-indicators button {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin: 0 5px;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .carousel-caption h3 {
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.8);
        }
        .carousel-caption p {
            font-size: 1.2rem;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.8);
        }
        
        .hero-section {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 100px 0;
            margin-bottom: 50px;
        }
        
        .feature-card {
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }
        
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            color: var(--primary);
        }
        
        .cta-button {
            padding: 15px 30px;
            font-size: 1.2rem;
            border-radius: 50px;
            transition: all 0.3s;
        }
        
        .cta-button:hover {
            transform: scale(1.05);
        }
        
        .navbar-brand {
            font-weight: 800;
            font-size: 1.8rem;
        }
        
        .stats-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary);
        }
        
        .testimonial-card {
            border-left: 5px solid var(--primary);
        }
        
        footer {
            background-color: #343a40;
            color: white;
            padding: 2rem 0;
        }
        
        /* Content spacing */
        .section-spacing {
            padding: 80px 0;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar - Fixed to always be black -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="home.jsp">
                <i class="fas fa-graduation-cap me-2"></i>EduManage
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-light ms-2" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary ms-2" href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Carousel Container with proper spacing -->
    <div class="carousel-container">
        <div id="mainCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="3000">
            <!-- Indicators -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
            </div>
            
            <!-- Carousel Items -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <!-- Replace with your actual image path -->
                    <img src="https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" class="d-block w-100" alt="Campus">
                    <div class="carousel-caption d-none d-md-block">
                        <h3><i class="fas fa-university me-2"></i>Welcome to EduManage</h3>
                        <p>Smart management for modern education</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <!-- Replace with your actual image path -->
                    <img src="https://images.unsplash.com/photo-1571260899304-425eee4c7efc?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" class="d-block w-100" alt="Classroom">
                    <div class="carousel-caption d-none d-md-block">
                        <h3><i class="fas fa-book-open me-2"></i>Organized Learning</h3>
                        <p>Track courses, students, and teachers with ease</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <!-- Replace with your actual image path -->
                    <img src="https://images.unsplash.com/photo-1523580494863-6f3031224c94?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" class="d-block w-100" alt="Students">
                    <div class="carousel-caption d-none d-md-block">
                        <h3><i class="fas fa-chalkboard-teacher me-2"></i>Empowering Education</h3>
                        <p>Bringing technology to classrooms</p>
                    </div>
                </div>
            </div>
            
            <!-- Carousel Controls - Added these missing controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <!-- Stats Section -->
    <section class="py-5 bg-light section-spacing">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 col-6 mb-4">
                    <div class="stats-number">500+</div>
                    <p class="text-muted">Active Courses</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="stats-number">2,000+</div>
                    <p class="text-muted">Happy Students</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="stats-number">100+</div>
                    <p class="text-muted">Expert Teachers</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="stats-number">98%</div>
                    <p class="text-muted">Satisfaction Rate</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="py-5 section-spacing">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold">Powerful Features</h2>
                <p class="lead text-muted">Everything you need for effective course management</p>
            </div>
            
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-user-tie"></i>
                            </div>
                            <h4 class="card-title">Admin Dashboard</h4>
                            <p class="card-text">Manage courses, assign teachers, and oversee the entire educational ecosystem with powerful administrative tools.</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-chalkboard-teacher"></i>
                            </div>
                            <h4 class="card-title">Teacher Portal</h4>
                            <p class="card-text">Create and manage courses, track student progress, and communicate effectively with your students.</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <h4 class="card-title">Student Experience</h4>
                            <p class="card-text">Browse available courses, enroll in classes, and track your learning progress all in one place.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="py-5 section-spacing">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold">What Our Users Say</h2>
                <p class="lead text-muted">Hear from our community of students and educators</p>
            </div>
            
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card testimonial-card h-100">
                        <div class="card-body">
                            <div class="d-flex mb-3">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                            </div>
                            <p class="card-text">"This platform has transformed how I manage my courses. The intuitive interface makes it easy to track student progress and engagement."</p>
                            <div class="d-flex align-items-center mt-3">
                                <img src="https://randomuser.me/api/portraits/women/65.jpg" 
                                     alt="User" class="rounded-circle me-3" width="50" height="50">
                                <div>
                                    <h6 class="mb-0">Sarah Johnson</h6>
                                    <small class="text-muted">Mathematics Teacher</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="card testimonial-card h-100">
                        <div class="card-body">
                            <div class="d-flex mb-3">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                            </div>
                            <p class="card-text">"As a student, I love how easy it is to find and enroll in courses. The platform keeps everything organized in one place."</p>
                            <div class="d-flex align-items-center mt-3">
                                <img src="https://randomuser.me/api/portraits/men/32.jpg" 
                                     alt="User" class="rounded-circle me-3" width="50" height="50">
                                <div>
                                    <h6 class="mb-0">Michael Chen</h6>
                                    <small class="text-muted">Computer Science Student</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="card testimonial-card h-100">
                        <div class="card-body">
                            <div class="d-flex mb-3">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                            </div>
                            <p class="card-text">"The administrative tools have saved me countless hours. Managing faculty assignments and course approvals has never been easier."</p>
                            <div class="d-flex align-items-center mt-3">
                                <img src="https://randomuser.me/api/portraits/women/45.jpg" 
                                     alt="User" class="rounded-circle me-3" width="50" height="50">
                                <div>
                                    <h6 class="mb-0">Emily Rodriguez</h6>
                                    <small class="text-muted">Academic Administrator</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="py-5 bg-primary text-white section-spacing">
        <div class="container text-center">
            <h2 class="fw-bold mb-4">Ready to Transform Your Educational Journey?</h2>
            <p class="lead mb-4">Join thousands of students and educators who are already benefiting from our platform</p>
            <a href="register.jsp" class="btn btn-light btn-lg cta-button">
                <i class="fas fa-rocket me-2"></i>Get Started Today
            </a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="text-center">
        <div class="container">
            <p>&copy; 2025 EduManage. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap & JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Navbar always stays black - removed scroll effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            // Always keep the navbar black
            navbar.style.backgroundColor = '#000';
        });
    </script>
</body>
</html>