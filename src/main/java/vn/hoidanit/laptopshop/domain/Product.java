package vn.hoidanit.laptopshop.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Name is required")
    @Size(min = 2, max = 100, message = "Name must be between 2 and 100 characters")
    private String name;

    @NotNull(message = "Price is required")
    @Min(value = 0, message = "Price must be greater than or equal to 0")
    private double price;

    private String image;

    @NotNull
    @Size(min = 10, max = 1000, message = "Detail description must be between 10 and 1000 characters")
    @NotBlank(message = "Detail description is required")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    @NotBlank(message = "Short description is required")
    @Size(min = 5, max = 500, message = "Short description must be between 5 and 500 characters")
    private String shortDesc;

    @NotNull(message = "Quantity is required")
    @Min(value = 0, message = "Quantity must be greater than or equal to 0")
    private long quantity;

    @NotNull(message = "Sold quantity is required")
    @Min(value = 0, message = "Sold quantity must be greater than or equal to 0")
    private long sold;

    @NotBlank(message = "Factory is required")
    @Size(min = 2, max = 100, message = "Factory must be between 2 and 100 characters")
    private String factory;

    @NotBlank(message = "Target is required")
    @Size(min = 2, max = 50, message = "Target must be between 2 and 50 characters")
    private String target;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image + ", detailDesc="
                + detailDesc + ", shortDesc=" + shortDesc + ", quantity=" + quantity + ", sold=" + sold + ", factory="
                + factory + ", target=" + target + "]";
    }

}
