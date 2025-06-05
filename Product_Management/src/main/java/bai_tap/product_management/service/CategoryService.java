package bai_tap.product_management.service;

import bai_tap.product_management.entity.Category;
import bai_tap.product_management.repository.CategoryRepository;
import bai_tap.product_management.repository.ICategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService{
    ICategoryRepository categoryRepository = new CategoryRepository();
    @Override
    public List<Category> findALL() {
        return categoryRepository.findALL();

    }
}
