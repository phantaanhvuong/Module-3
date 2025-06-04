package bai_tap.product_management.repository;

import bai_tap.product_management.entity.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void add(Product product);
    void deleteById(int id);
    Product findById(int id);
    List<Product> searchByName(String name);
    void update(Product product);


}
