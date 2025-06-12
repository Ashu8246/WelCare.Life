<%@ page import="entities.Patient" %><%--
  Created by IntelliJ IDEA.
  User: ashug
  Date: 12-06-2025
  Time: 02:58 am
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>WelCare.Life</title>

    <!-- Bootstrap 5 & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body class="bg-light">

<%
    Patient patient  = (Patient) session.getAttribute("patient");
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center fw-bold" href="#">

            WelCare.<span class="text-primary">Life</span>
        </a>
        <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav ms-auto me-3">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
            </ul>
            <%=patient.getPid()%>

        </div>
    </div>
</nav>
<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow rounded-4 p-3">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold" id="loginModalLabel">Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pt-0">
                <form action="LoginChecker" method="post">
                    <div class="mb-3">
                        <label for="loginEmail" class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-control" id="loginEmail" placeholder="your.email@example.com" required>
                    </div>
                    <div class="mb-3">
                        <label for="loginPassword" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="loginPassword" placeholder="Enter your password" required>
                    </div>
                    <div class="mb-3">
                        <label for="loginEmail" class="form-label">Role</label>
                        <select class="form-control" name="role" id="role">
                            <option value="admin">Select Role</option>
                            <option value="admin">Admin</option>
                            <option value="doctor">Doctor</option>
                            <option value="patient">Patient</option>
                        </select>

                    </div>
                    <div class="d-grid mt-4">
                        <button type="submit" class="btn btn-primary fw-semibold">Login</button>
                    </div>
                </form>
                <div class="text-center mt-3 small">
                    Don’t have an account? <a href="#" class="text-decoration-none">Sign up</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Sign Up Modal -->
<div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow rounded-4 p-3">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold" id="signupModalLabel">Sign Up</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pt-0">
                <form action="RegisterChecker" method="post">
                    <div class="row g-3 mb-3">
                        <div class="col">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" name="fname" class="form-control" id="firstName" placeholder="First name" required>
                        </div>
                        <div class="col">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" name="lname" class="form-control" id="lastName" placeholder="Last name" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="signupEmail" class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-control" id="signupEmail" placeholder="your.email@example.com" required>
                    </div>
                    <div class="mb-3">
                        <label for="signupPassword" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="signupPassword" placeholder="Create a password" required>
                    </div>

                    <div class="mb-3">
                        <label for="loginEmail" class="form-label">Role</label>
                        <select class="form-control" name="role" id="role">
                            <option value="admin">Select Role</option>
                            <option value="doctor">Doctor</option>
                            <option value="patient">Patient</option>
                        </select>

                    </div>
                    <div class="d-grid mt-4">
                        <button type="submit" class="btn btn-primary fw-semibold">Create Account</button>
                    </div>
                </form>
                <div class="text-center mt-3 small">
                    Already have an account?
                    <a href="#" class="text-decoration-none" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Hero Section -->
<section class="hero-section">
    <div class="hero-overlay"></div>
    <div class="hero-content text-white px-3">
        <h1 class="hero-title">WelCare.<span class="text-info">Life</span></h1>
        <p class="hero-subtitle">
            Experience compassionate, comprehensive healthcare designed around you. Connect with trusted professionals,
            manage your health records, and access care whenever you need it.
        </p>
        <div class="container py-5">
            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="custom-card">
                        <h5>Division 1</h5>
                        <p>This is content for the first division.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="custom-card">
                        <h5>Division 2</h5>
                        <p>This is content for the second division.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="custom-card">
                        <h5>Division 3</h5>
                        <p>This is content for the third division.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-6">
                    <div class="custom-card">
                        <h5>Division 4</h5>
                        <p>This is content for the fourth division.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-6">
                    <div class="custom-card">
                        <h5>Division 5</h5>
                        <p>This is content for the fifth division.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
