package bai_tap.product_management.repository;

import bai_tap.product_management.entity.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> findALL();
}
