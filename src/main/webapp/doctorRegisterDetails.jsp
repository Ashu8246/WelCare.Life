<%--
  Created by IntelliJ IDEA.
  User: ashug
  Date: 12-06-2025
  Time: 04:24 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Patient Registration Form</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

  <style>
    body {
      background: linear-gradient(135deg, #74ebd5, #ACB6E5);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .register-card {
      background: #ffffff;
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
      max-width: 700px;
      width: 100%;
    }

    .register-card h2 {
      font-weight: 700;
      margin-bottom: 20px;
      text-align: center;
      color: #333;
    }

    .form-control, .form-select {
      border-radius: 8px;
      padding: 12px;
    }

    .btn-primary {
      background-color: #4A90E2;
      border: none;
      padding: 12px;
      border-radius: 8px;
      font-weight: 600;
    }

    .btn-primary:hover {
      background-color: #357ABD;
    }

    /* Hero section styling */
    .hero {
      height: 90vh;
      background: linear-gradient(135deg, #4facfe, #00f2fe);
      padding: 80px 20px;
    }
    .bg-primary {
      --bs-bg-opacity: 1;
      background-color: rgba(var(--bs-primary-rgb), var(--bs-bg-opacity)) !important;
    }

  </style>
</head>
<body>

<%
  String fname = (String)session.getAttribute("fname");
  String d_id = (String) session.getAttribute("d_id");
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

  </div>
</nav>
<div class="register-card">
  <h2>Doctor Registration</h2>
  <form action="DetailsChecker" method="post" id="registerForm">
    <div class="row g-3">
      <div class="col-md-6">
        <label for="patientId" class="form-label">Patient ID</label>
        <input type="text" name="p_id" value="<%=d_id%>" class="form-control" id="patientId" disabled>
      </div>
      <div class="col-md-6">
        <label for="firstName" class="form-label">First Name</label>
        <input type="text" value="<%=fname%>" class="form-control" id="firstName" disabled>
      </div>
      <div class="col-md-6">
        <label for="dob" class="form-label">Date of Birth</label>
        <input type="date" name="dob" class="form-control" id="dob" required>
      </div>
      <div class="col-md-6">
        <label for="phone" class="form-label">Phone</label>
        <input type="tel" name="phone" class="form-control" id="phone" required>
      </div>
      <div class="col-md-6">
        <label for="address" class="form-label">Address</label>
        <input type="text" name="address" class="form-control" id="address" required>
      </div>
      <div class="col-md-6">
        <label for="city" class="form-label">City</label>
        <input type="text" name="city" class="form-control" id="city" required>
      </div>
      <div class="col-md-6">
        <label for="gender" class="form-label">Gender</label>
        <select id="gender" name="gender" class="form-select" required>
          <option value="" selected disabled>Select gender</option>
          <option value="male">Male</option>
          <option value="female">Female</option>
          <option value="other">Other</option>
        </select>
      </div>
      <div class="col-md-6">
        <label for="gender" class="form-label">Experience (in years)</label>
        <select id="gender" name="experience" class="form-select" required>
          <option value="">-- Select Experience Range --</option>
          <option value="0-10">0–10</option>
          <option value="11-20">11–20</option>
          <option value="21-30">21–30</option>
          <option value="31-40">31–40</option>
          <option value="41-50">41–50</option>
          <option value="51-60">51–60</option>
          <option value="61-70">61–70</option>
          <option value="71-80">71–80</option>
          <option value="81-90">81–90</option>
          <option value="91-100">91–100</option>

        </select>
      </div>
      <div class="col-md-6">
        <label for="patientId" class="form-label">Qualification</label>
        <input type="text" name="qualification" class="form-control" id="patientId" >
      </div>
      <div class="col-md-6">
        <label for="patientId" class="form-label">spealization</label>
        <input type="text" name="spelization" class="form-control" id="patientId" >
      </div>

      <div class="d-grid mt-4">
        <input type="submit" class="btn btn-primary" value="Register">
      </div>
    </div>
  </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Simple Form Validation -->
<script>
</script>
</body>
</html>
