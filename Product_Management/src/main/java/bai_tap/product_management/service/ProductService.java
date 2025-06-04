package bai_tap.product_management.service;

import bai_tap.product_management.entity.Product;
import bai_tap.product_management.repository.IProductRepository;
import bai_tap.product_management.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void deleteById(int id) {
        productRepository.deleteById(id);
    }
    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }
    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }
    @Override
    public void update(Product product) {
        productRepository.update(product);
    }


}
