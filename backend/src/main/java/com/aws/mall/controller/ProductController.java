package com.aws.mall.controller;

import com.aws.mall.model.Product;
import com.aws.mall.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.UUID;
import java.math.BigDecimal;

@RestController
@RequestMapping("/api/products")
public class ProductController {
    
    @Autowired
    private ProductRepository productRepository;
    
    @GetMapping
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
    
    @GetMapping("/{id}")
    public Product getProduct(@PathVariable String id) {
        return productRepository.findById(id).orElse(null);
    }
    
    @PostMapping("/init")
    public String initProducts() {
        // 테스트 상품 데이터 생성
        for (int i = 1; i <= 6; i++) {
            Product product = new Product();
            product.setProductId(UUID.randomUUID().toString());
            product.setName("상품 " + i);
            product.setDescription("상품 " + i + " 설명입니다.");
            product.setPrice(BigDecimal.valueOf(i * 10000));
            product.setCategory("전자제품");
            product.setStock(100);
            productRepository.save(product);
        }
        return "테스트 상품 데이터 생성 완료!";
    }
}