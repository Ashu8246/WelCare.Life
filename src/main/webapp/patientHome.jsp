<%@ page import="entities.Patient" %>
<%@ page import="dao.Display" %><%--
  Created by IntelliJ IDEA.
  User: ashug
  Date: 16-06-2025
  Time: 03:33 am
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
  String pid = (String) session.getAttribute("pid");
  if(pid == null)
  {
    response.sendRedirect("index.jsp");
  }
  else {
    Patient patient = null;
    try {

      Display display = new Display();
      patient = display.getPatientdetails(pid);

    } catch (Exception e) {
      System.out.println(e);
    }
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
          <a class="nav-link active" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Profile</a>
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
          if(patient != null)
          {
        %><%=pid%><%
        }
        else {
          response.sendRedirect("index.jsp");
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
<section class="hero-section"></section>

<section style="background: linear-gradient(white,#ACB6E5,#91a4ff); border-radius: 30px;">
  <div class="container py-5">
    <div class="row g-4">

      <!-- Emergency Info -->
      <div class="col-md-4">
        <div class="info-box">
          <h5>Status </h5>

          <p class="text-muted mt-3">
<%--            To update Availability status use toggle button.--%>
          </p>
          <form action="UpdateToggleDoctorChecker" method="post">
            <input type="hidden" name="d_id" value="">
            <input type="hidden" name="type" value="availability">
            <button class="emergency-btn" type="submit" style="margin-right: 20px;">

              <i class="bi"></i>

            </button >
          </form>

        </div>
      </div>

      <!-- Make Appointment -->
      <div class="col-md-4">
        <div class="info-box">
          <h5>Make an Appointment</h5>
          <form class="mt-3">
            <div class="row g-2 mb-2">
              <div class="col">
                <input type="text" name="reason">
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


<!-- Subscribe Section -->
<section id="contact" class="subscribe-section">
  <div class="contact-form">
    <h2>Contact Us</h2>
    <form id="contactForm" method="post" action="ContactUsChecker">
      <div class="row mb-3">
        <div class="col-md-6">
          <label for="name" class="form-label">Full Name</label>
          <input type="text" name="name" id="name" class="form-control" placeholder="Your name" required />
        </div>
        <div class="col-md-6">
          <label for="email" class="form-label">Email Address</label>
          <input type="email" name="email" id="email" class="form-control" placeholder="your@email.com" required />
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-6">
          <label for="phone" class="form-label">Phone Number</label>
          <input type="tel" name="phone" id="phone" class="form-control" placeholder="+91985648723" maxlength="13"/>
        </div>
        <div class="col-md-6">
          <label for="subject" class="form-label">Subject</label>
          <input type="text" id="subject" name="reason" class="form-control" placeholder="Query, Feedback, Support..." />
        </div>
      </div>
      <div class="mb-3">
        <label for="loginEmail" class="form-label">Who are you ?</label>
        <select class="form-control" name="role" id="role">
          <option value="">Select Role</option>
          <option value="Doctor">Doctor</option>
          <option value="Patient">Patient</option>
          <option value="Non-Registered User">Non-Registered User</option>
        </select>
      </div>
      <div class="mb-3">
        <label for="message" class="form-label">Message</label>
        <textarea id="message" name="message" class="form-control" rows="5" placeholder="Write your message here..." required></textarea>
      </div>
      <button type="submit" class="btn btn-primary px-4">Send Message</button>
    </form>
  </div>
</section>

<!-- Footer -->
<footer id="about">
  <div class="container">
    <div class="row footer-section">
      <div class="col-md-4 mb-4">
        <div class="footer-logo">💙 WelCare.<span class="text-primary">Life</span></div>
        <p class="mt-3">
          Experience compassionate, comprehensive healthcare tailored to you.
          Manage your records, connect with professionals, and access care easily.
        </p>
      </div>
      <div class="col-md-4 mb-4">
        <h5>Contact</h5>
        <p><strong>Address:</strong> Indore, India</p>
        <p><strong>Phone:</strong> +91 98765 43210</p>
        <p><strong>Email:</strong> welcare.life@gmail.com</p>
      </div>
      <div class="col-md-4 mb-4">
        <h5>Useful Links</h5>
        <ul class="list-unstyled">
          <li><a href="#">Home</a></li>
          <li><a href="#">About us</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      ©2025 WelCare.Life. All rights reserved | Made with ❤️ by Team WelCare
    </div>
  </div>
</footer>
<% }%>
<!-- Bootstrap + Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
