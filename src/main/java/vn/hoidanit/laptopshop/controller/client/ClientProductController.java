package vn.hoidanit.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class ClientProductController {
    private final ProductService productService;

    public ClientProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/client/product")
    public String getProduct(Model model) {
        long id = 5L; // Gán giá trị cố định id = 5
        model.addAttribute("id", id);
        return "/client/product/show"; // Trả về view chứa đoạn mã JSP
    }

    @GetMapping("/client/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("id", id);
        model.addAttribute("product", product);
        return "/client/product/show";
    }
}
