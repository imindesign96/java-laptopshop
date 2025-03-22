package vn.hoidanit.laptopshop.controller.client;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import vn.hoidanit.laptopshop.domain.dto.LoginDTO;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final UploadService uploadService;
    @Autowired
    private final PasswordEncoder passwordEncoder;

    public HomePageController(
            ProductService productService,
            UserService userService,
            UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.productService = productService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.getAllProducts();

        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("registerDTO", new RegisterDTO());
        return "client/auth/register";
    }

    // @GetMapping("/login")
    // public String showLoginForm(Model model) {
    // model.addAttribute("loginDTO", new LoginDTO());
    // return "client/auth/login";
    // }

    @PostMapping("client/auth/register")
    public String processRegistration(
            @Valid @ModelAttribute("registerDTO") RegisterDTO registerDTO,
            BindingResult result,
            Model model) throws IOException {

        if (result.hasErrors()) {
            RegisterDTO safeDTO = new RegisterDTO();
            safeDTO.setEmail(registerDTO.getEmail());
            safeDTO.setFullName(registerDTO.getFullName());
            safeDTO.setAddress(registerDTO.getAddress());
            safeDTO.setPhone(registerDTO.getPhone());
            safeDTO.setAvatarFile(registerDTO.getAvatarFile());
            model.addAttribute("registerDTO", safeDTO);
            return "client/auth/register";
        }

        if (!registerDTO.getPassword().equals(registerDTO.getConfirmPassword())) {
            model.addAttribute("registerDTO", registerDTO);
            model.addAttribute("error", "Passwords do not match");
            return "client/auth/register";
        }

        User user = new User();
        user.setEmail(registerDTO.getEmail());
        // Mã hóa mật khẩu trước khi gán
        String encodedPassword = passwordEncoder.encode(registerDTO.getPassword());
        user.setPassword(encodedPassword);
        user.setFullName(registerDTO.getFullName());
        user.setAddress(registerDTO.getAddress());
        user.setPhone(registerDTO.getPhone());

        MultipartFile avatarFile = registerDTO.getAvatarFile();
        if (avatarFile != null && !avatarFile.isEmpty()) {
            String avatarPath = uploadService.handleUploadFile(avatarFile, "avatars");
            user.setAvatar(avatarPath);
        } else {
            model.addAttribute("registerDTO", registerDTO);
            model.addAttribute("error", "Avatar is required");
            return "client/auth/register";
        }

        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }
}
