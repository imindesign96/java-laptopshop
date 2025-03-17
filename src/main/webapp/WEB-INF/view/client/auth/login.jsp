<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Login</title>
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

                    .login-container {
                        background-color: white;
                        padding: 20px;
                        border-radius: 10px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        width: 100%;
                        max-width: 400px;
                    }

                    .btn-login {
                        background-color: #4A90E2;
                        border: none;
                    }

                    .btn-login:hover {
                        background-color: #357ABD;
                    }

                    .register-link {
                        color: #666;
                        text-decoration: none;
                    }

                    .register-link:hover {
                        text-decoration: underline;
                    }

                    .error {
                        color: red;
                        font-size: 12px;
                        margin-top: 5px;
                    }
                </style>
                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            </head>

            <body>
                <div class="login-container">
                    <h2 class="text-center mb-4">Login</h2>
                    <form:form method="post" action="/login" modelAttribute="loginDTO">
                        <c:if test="${param.error != null}">
                            <div class="alert alert-danger">Invalid email or password</div>
                        </c:if>
                        <c:if test="${param.logout != null}">
                            <div class="alert alert-success">You have been logged out</div>
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
                        <button type="submit" class="btn btn-login w-100 text-white">Login</button>
                    </form:form>
                    <div class="text-center mt-3">
                        <a href="/register" class="register-link">Need an account? Sign up</a>
                    </div>
                </div>
            </body>

            </html>