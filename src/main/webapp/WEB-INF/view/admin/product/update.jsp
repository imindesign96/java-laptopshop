<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Dashboard - Hỏi Dân IT 222</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp"></jsp:include>
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp"></jsp:include>

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Update User</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Update</li>
                                </ol>

                                <div class="mt-5">

                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a user</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/product/update"
                                                modelAttribute="newProduct">
                                                <div class="mb-3">
                                                    <form:hidden path="id" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Name:</label>
                                                    <form:input type="text" class="form-control" path="name"
                                                        readonly="true" />
                                                    <form:errors path="name" cssClass="text-danger" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Price:</label>
                                                    <form:input type="number" step="0.01" class="form-control"
                                                        path="price" />
                                                    <form:errors path="price" cssClass="text-danger" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Detail Description:</label>
                                                    <form:input type="text" class="form-control" path="detailDesc" />
                                                    <form:errors path="detailDesc" cssClass="text-danger" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Short Description:</label>
                                                    <form:input type="text" class="form-control" path="shortDesc" />
                                                    <form:errors path="shortDesc" cssClass="text-danger" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Quantity:</label>
                                                    <form:input type="number" class="form-control" path="quantity" />
                                                    <form:errors path="quantity" cssClass="text-danger" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Factory:</label>
                                                    <form:input type="text" class="form-control" path="factory" />
                                                    <form:errors path="factory" cssClass="text-danger" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Target:</label>
                                                    <form:input type="text" class="form-control" path="target" />
                                                    <form:errors path="target" cssClass="text-danger" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Image:</label>
                                                    <form:input type="text" class="form-control" path="image" />
                                                    <form:errors path="image" cssClass="text-danger" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Sold:</label>
                                                    <form:input type="number" class="form-control" path="sold"
                                                        value="0" />
                                                    <form:errors path="sold" cssClass="text-danger" />
                                                </div>



                                                <button type="submit" class="btn btn-warning">Update</button>
                                            </form:form>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp"></jsp:include>

                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/chart-area-demo.js"></script>
                <script src="/js/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/datatables-simple-demo.js"></script>
            </body>

            </html>