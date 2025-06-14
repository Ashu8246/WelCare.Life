<%@ page import="entities.Patient" %>
<%@ page import="javax.print.Doc" %>
<%@ page import="entities.Doctor" %><%--
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
    <link rel="stylesheet" href="css/doc-style.css"/>
</head>
<body class="bg-light">

<%
    Doctor doctor = (Doctor) session.getAttribute("doctor");
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm fixed-top">
    <div class="container">
        <!-- Logo + Brand -->
        <a class="navbar-brand d-flex align-items-center" href="#">
            <span class="fw-bold text-dark">WelCare<span class="text-primary">.Life</span></span>
        </a>

        <!-- Toggler -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar content -->
        <div class="collapse navbar-collapse" id="navbarMenu">
            <!-- Nav links -->
            <ul class="navbar-nav me-auto mb-2 mb-md-0 ms-md-4">
                <li class="nav-item">
                    <a class="nav-link active" href="#home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#profile">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#about">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#contact">Contact</a>
                </li>
            </ul>
            <div style="margin-right: 10px;" class="d-flex gap-2">
                <%
                    if(doctor != null)
                    {
                        doctor.getD_id();
                    }
                    else
                    {
                %>User<%
                }
            %>
            </div>
            <div class="d-flex gap-2">
                <a href="signOut.jsp"><button class="btn btn-primary" >Sign out</button></a>
            </div>
        </div>
    </div>
</nav>
<!-- Hero Section -->
<section class="hero-section">
</section>
<section>
<div class="container py-5">
    <div class="row g-4">

        <!-- Opening Hours -->
        <div class="info-box border-primary">
            <h5>Appointments</h5>
            <div class="table-responsive mt-3">
                <table class="table bg-transparent mb-0 no-vertical-borders">
                    <thead class="table-light">
                    <tr>
                        <th>Name</th>
                        <th>Reason</th>
                        <th>Date</th>
                        <th>Age</th>
                        <th>Blood Group</th>
                        <th>City</th>
                        <th>Phone No</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>John Doe</td>
                        <td>Fever</td>
                        <td>2025-06-14</td>
                        <td>32</td>
                        <td>O+</td>
                        <td>Delhi</td>
                        <td>9876543210</td>
                    </tr>

                    <!-- Add more rows as needed -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Emergency Info -->
        <div class="col-md-4">
            <div class="info-box">
                <h5>Emergency</h5>
                <button class="emergency-btn">
                    <i class="bi bi-telephone-fill"></i> +34 586 778 8892
                </button>
                <p class="text-muted mt-3">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus.
                </p>
            </div>
        </div>

        <!-- Make Appointment -->
        <div class="col-md-4">
            <div class="info-box">
                <h5>Make an Appointment</h5>
                <form class="mt-3">
                    <div class="row g-2 mb-2">
                        <div class="col">
                            <select class="form-select" required>
                                <option value="">Select Department</option>
                                <option>Cardiology</option>
                                <option>Dentistry</option>
                            </select>
                        </div>
                        <div class="col">
                            <select class="form-select" required>
                                <option value="">Select Doctor</option>
                                <option>Dr. John</option>
                                <option>Dr. Smith</option>
                            </select>
                        </div>
                    </div>
                    <div class="row g-2 mb-2">
                        <div class="col">
                            <input type="text" class="form-control" placeholder="Name" required>
                        </div>
                        <div class="col">
                            <input type="text" class="form-control" placeholder="Phone No" required>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="appointment-btn">Book Appointment</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
</section>
<!-- Bootstrap + Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
