package bai_tap.product_management.service;

import bai_tap.product_management.dto.ProductDto;
import bai_tap.product_management.entity.Product;
import bai_tap.product_management.repository.IProductRepository;
import bai_tap.product_management.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<ProductDto> findAll() {
        return productRepository.findAll();
    }

    @Override
    public boolean add(Product product) {
       return productRepository.add(product);
    }

    @Override
    public boolean deleteById(int id) {
        return productRepository.deleteById(id);
    }
    @Override
    public List<ProductDto> searchByNameAndCategory(String name, String category) {
        return productRepository.searchByNameAndCategory(name, category);
    }
    @Override
    public boolean update(Product product) {
        return productRepository.update(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }


}
