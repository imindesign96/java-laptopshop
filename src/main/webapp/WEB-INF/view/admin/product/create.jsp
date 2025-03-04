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
                                <h1 class="mt-4">Manager Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Products</li>
                                </ol>

                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h2 class="text-center mb-4">Create a Product</h2>

                                            <form:form modelAttribute="newProduct" method="post"
                                                action="/admin/product/create" enctype="multipart/form-data"
                                                class="row g-3">
                                                <!-- Hàng 1: Name và Price (2 cột ngang) -->
                                                <div class="col-md-6">
                                                    <label for="name" class="form-label">Name:</label>
                                                    <form:input path="name" class="form-control" id="name" />
                                                    <form:errors path="name" cssClass="text-danger" />
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="price" class="form-label">Price:</label>
                                                    <form:input path="price" type="number" step="0.01"
                                                        class="form-control" id="price" value="0.0" />
                                                    <form:errors path="price" cssClass="text-danger" />
                                                </div>

                                                <!-- Hàng 2: Detail Description (1 cột riêng) -->
                                                <div class="col-12">
                                                    <label for="detailDesc" class="form-label">Detail
                                                        Description:</label>
                                                    <form:textarea path="detailDesc" class="form-control"
                                                        id="detailDesc" rows="3" />
                                                    <form:errors path="detailDesc" cssClass="text-danger" />
                                                </div>

                                                <!-- Hàng 3: Short Description và Quantity (2 cột ngang) -->
                                                <div class="col-md-6">
                                                    <label for="shortDesc" class="form-label">Short Description:</label>
                                                    <form:input path="shortDesc" class="form-control" id="shortDesc" />
                                                    <form:errors path="shortDesc" cssClass="text-danger" />

                                                </div>
                                                <div class="col-md-6">
                                                    <label for="quantity" class="form-label">Quantity:</label>
                                                    <form:input path="quantity" type="number" class="form-control"
                                                        id="quantity" value="0" />
                                                    <form:errors path="quantity" cssClass="text-danger" />

                                                </div>

                                                <!-- Hàng 4: Factory và Target (2 cột ngang) -->
                                                <div class="col-md-6">
                                                    <label for="factory" class="form-label">Factory:</label>
                                                    <form:select path="factory" class="form-select" id="factory">
                                                        <form:option value="Apple (MacBook)" label="Apple (MacBook)" />

                                                        <!-- Có thể thêm các option khác nếu cần -->
                                                    </form:select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="target" class="form-label">Target:</label>
                                                    <form:select path="target" class="form-select" id="target">
                                                        <form:option value="Gaming" label="Gaming" />
                                                        <!-- Có thể thêm các option khác nếu cần -->
                                                    </form:select>
                                                </div>

                                                <!-- Hàng 5: Image (1 cột riêng) -->
                                                <div class="col-12">
                                                    <label for="image" class="form-label">Image:</label>
                                                    <input type="file" id="productFile" name="productFile"
                                                        class="form-control" />

                                                    <form:hidden path="image" id="image" />
                                                    <img id="productPreview" src=""
                                                        style="display:block; margin-top: 10px;" width="300" />
                                                </div>

                                                <!-- Hàng 6: Nút Create (1 cột riêng, căn giữa) -->
                                                <div class="col-12 text-center">
                                                    <button type="submit" class="btn btn-primary mt-3">Create</button>
                                                </div>
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

                <script>
                    document.getElementById('productFile').addEventListener('change', function (e) {
                        const file = e.target.files[0];
                        if (file) {
                            const imgURL = URL.createObjectURL(file);
                            document.getElementById('productPreview').src = imgURL;
                            document.getElementById('productPreview').style.display = 'block';
                        }
                    });
                </script>
            </body>