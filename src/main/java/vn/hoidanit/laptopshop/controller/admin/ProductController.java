package vn.hoidanit.laptopshop.controller.admin;

import java.io.IOException;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(
            ProductService productService,
            UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);

        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProduct(Model model,
            @Valid @ModelAttribute("newProduct") Product product,
            BindingResult bindingResult,
            @RequestParam("productFile") MultipartFile file) {

        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors()
                    .forEach(error -> System.out.println("Validation error: " + error.getDefaultMessage()));
            return "admin/product/create";
        }

        // In thông tin để kiểm tra, sau này thay bằng logic lưu vào database
        System.out.println("Name: " + product.getName());
        System.out.println("Price: " + product.getPrice());
        System.out.println("Image: " + product.getImage());
        System.out.println("Detail Desc: " + product.getDetailDesc());
        System.out.println("Short Desc: " + product.getShortDesc());
        System.out.println("Quantity: " + product.getQuantity());
        System.out.println("Sold: " + product.getSold());
        System.out.println("Factory: " + product.getFactory());
        System.out.println("Target: " + product.getTarget());

        try {
            if (!file.isEmpty()) {
                String addedProduct = this.uploadService.handleUploadFile(file, "product");
                product.setImage(addedProduct);
            }
            this.productService.handleSaveProduct(product);
        } catch (Exception e) {
            // Thêm thông báo lỗi vào model và trả về form
            model.addAttribute("error", "Error uploading file: " + e.getMessage());
            return "admin/product/create";
        }

        return "redirect:/admin/product"; // Chuyển hướng sau khi lưu
    }

}
