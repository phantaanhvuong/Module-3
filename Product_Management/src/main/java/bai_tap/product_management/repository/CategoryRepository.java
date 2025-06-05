package bai_tap.product_management.repository;

import bai_tap.product_management.entity.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository{
    private final String SELECT_ALL = "select* from category;";
    @Override
    public List<Category> findALL() {
        List<Category> categoryList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id_category");
                String name = resultSet.getString("name_category");
                categoryList.add(new Category(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }
}
