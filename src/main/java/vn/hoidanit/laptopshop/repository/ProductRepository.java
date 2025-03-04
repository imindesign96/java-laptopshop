package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;

// crud: create, read, update, delete
@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    @SuppressWarnings("unchecked")
    Product save(Product product);

    List<Product> findAll();

}
