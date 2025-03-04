package vn.hoidanit.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.User;

@Controller
public class ClientProductController {

    @GetMapping("/client/product")
    public String getProduct(Model model) {
        long id = 5L; // Gán giá trị cố định id = 5
        model.addAttribute("id", id);
        return "/client/product/show"; // Trả về view chứa đoạn mã JSP
    }

    @GetMapping("/client/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        System.out.print("id: " + id);
        model.addAttribute("id", id);
        return "/client/product/show";
    }
}
