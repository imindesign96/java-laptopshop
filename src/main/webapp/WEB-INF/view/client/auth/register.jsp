<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Create Account</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <style>
                    body {
                        background-color: #4A90E2;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 100vh;
                        margin: 0;
                    }

                    .register-container {
                        background-color: white;
                        padding: 20px;
                        border-radius: 10px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        width: 100%;
                        max-width: 500px;
                    }

                    .btn-create {
                        background-color: #4A90E2;
                        border: none;
                    }

                    .btn-create:hover {
                        background-color: #357ABD;
                    }

                    .login-link {
                        color: #666;
                        text-decoration: none;
                    }

                    .login-link:hover {
                        text-decoration: underline;
                    }

                    .error {
                        color: red;
                        font-size: 12px;
                        margin-top: 5px;
                    }
                </style>
                <!-- jQuery -->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body>
                <div class="register-container">
                    <h2 class="text-center mb-4">Create Account</h2>
                    <form:form method="post" action="client/auth/register" modelAttribute="registerDTO"
                        enctype="multipart/form-data">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <form:input path="email" type="email" class="form-control" id="email" />
                            <form:errors path="email" cssClass="error" />
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <form:input path="password" type="password" class="form-control" id="password" />
                            <form:errors path="password" cssClass="error" />
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                            <form:input path="confirmPassword" type="password" class="form-control"
                                id="confirmPassword" />
                            <form:errors path="confirmPassword" cssClass="error" />
                        </div>
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full name</label>
                            <form:input path="fullName" type="text" class="form-control" id="fullName" />
                            <form:errors path="fullName" cssClass="error" />
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <form:textarea path="address" rows="3" class="form-control" id="address" />
                            <form:errors path="address" cssClass="error" />
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <form:input path="phone" type="tel" class="form-control" id="phone" />
                            <form:errors path="phone" cssClass="error" />
                        </div>
                        <div class="mb-3">
                            <label for="avatarFile" class="form-label">Avatar:</label>
                            <input class="form-control" type="file" id="avatarFile" name="avatarFile"
                                accept=".png, .jpg, .jpeg">
                            <form:errors path="avatarFile" cssClass="error" />
                        </div>
                        <div class="mb-3">
                            <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview" />
                        </div>
                        <button type="submit" class="btn btn-create w-100 text-white">Create Account</button>
                    </form:form>
                    <div class="text-center mt-3">
                        <a href="/login" class="login-link">Have an account? Go to login</a>
                    </div>
                </div>
            </body>

            </html>