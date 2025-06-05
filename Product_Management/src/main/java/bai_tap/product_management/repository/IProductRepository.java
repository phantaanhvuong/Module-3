package bai_tap.product_management.repository;

import bai_tap.product_management.dto.ProductDto;
import bai_tap.product_management.entity.Product;

import java.util.List;

public interface IProductRepository {
    List<ProductDto> findAll();

    boolean add(Product product);

    boolean deleteById(int id);


    List<ProductDto> searchByNameAndCategory(String name, String category);

    boolean update(Product product);

    Product findById(int id);

}
