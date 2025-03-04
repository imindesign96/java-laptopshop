package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public UserController(
            UserService userService,
            UploadService uploadService,
            BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("1@gmail.com");
        System.out.println(arrUsers);

        model.addAttribute("eric", "test");
        model.addAttribute("hoidanit", "from controller with model");
        return "hello";
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users1", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetail(Model model, @PathVariable long id) {
        System.out.print("id: " + id);
        model.addAttribute("id", id);
        User userInfo = this.userService.getUserById(id);

        model.addAttribute("email", userInfo.getEmail());
        model.addAttribute("fullName", userInfo.getFullName());
        model.addAttribute("address", userInfo.getAddress());

        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create") // POST
    public String createUserPage(Model model,
            @Valid @ModelAttribute("newUser") User hoidanit,
            BindingResult result,
            @RequestParam("avatarFile") MultipartFile file) {
        if (result.hasErrors()) {
            // Nếu có lỗi validation, trả về lại form với lỗi
            return "admin/user/create";
        }

        try {
            String avatar = this.uploadService.handleUploadFile(file, "avatar");
            String hashPassword = this.bCryptPasswordEncoder.encode(hoidanit.getPassword());
            hoidanit.setAvatar(avatar);
            hoidanit.setPassword(hashPassword);

            hoidanit.setRole(this.userService.getRoleByName(hoidanit.getRole().getName()));

            this.userService.handleSaveUser(hoidanit);
            return "redirect:/admin/user";
        } catch (Exception e) {
            model.addAttribute("error", "Error uploading file or saving user: " + e.getMessage());
            return "admin/user/create";
        }
    }

    @GetMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User hoidanit) {
        User currentUser = this.userService.getUserById(hoidanit.getId());
        if (currentUser != null) {
            currentUser.setAddress(hoidanit.getAddress());
            currentUser.setFullName(hoidanit.getFullName());
            currentUser.setPhone(hoidanit.getPhone());

            // bug here
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User eric) {
        this.userService.deleteAUser(eric.getId());
        return "redirect:/admin/user";
    }
}
