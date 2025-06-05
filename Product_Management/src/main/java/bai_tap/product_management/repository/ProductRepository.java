package bai_tap.product_management.repository;

import bai_tap.product_management.dto.ProductDto;
import bai_tap.product_management.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final String SELECT_ALL_JOIN = "select p.*,c.name_category  from product p join category c on p.id_category = c.id_category;";
    private final String INSERT_INTO = "insert into product( name ,price,`describe`,manufacturer,id_category) values(?,?,?,?,?)";
    private final String DELETE_BY_ID = "delete from product where id =?;";
    private final String SEARCH_BY_NAME_CATEGORY = "SELECT p.*, c.name_category FROM product p JOIN category c ON p.id_category = c.id_category WHERE p.name LIKE ? AND c.name_category LIKE ?";
    private final String UPDATE_PRODUCT = "UPDATE product SET name=?, price=?, `describe`=?, manufacturer=?, id_category=? WHERE id=?";

    @Override
    public List<ProductDto> findAll() {
        List<ProductDto> productList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_JOIN);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String describe = resultSet.getString("describe");
                String manufacturer = resultSet.getString("manufacturer");
                String name_category = resultSet.getString("name_category");
                ProductDto productDto = new ProductDto(id, name, price, describe, manufacturer, name_category);
                productList.add(productDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public boolean add(Product product) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescribe());
            preparedStatement.setString(4, product.getManufacturer());
            preparedStatement.setInt(5, product.getId_category());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi kết nối db");
        }
        return false;
    }

    @Override
    public boolean deleteById(int id) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);) {
            preparedStatement.setInt(1, id);
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi kết nối db");
        }
        return false;
    }
    @Override
    public List<ProductDto> searchByNameAndCategory(String name, String category) {
        List<ProductDto> resultList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(SEARCH_BY_NAME_CATEGORY)) {
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + category + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("name");
                double price = rs.getDouble("price");
                String describe = rs.getString("describe");
                String manufacturer = rs.getString("manufacturer");
                String categoryName = rs.getString("name_category");
                resultList.add(new ProductDto(id, productName, price, describe, manufacturer, categoryName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultList;
    }

    @Override
    public boolean update(Product product) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(UPDATE_PRODUCT)) {
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getDescribe());
            ps.setString(4, product.getManufacturer());
            ps.setInt(5, product.getId_category());
            ps.setInt(6, product.getId());
            int rows = ps.executeUpdate();
            return rows == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Product findById(int id) {
        String SELECT_BY_ID = "SELECT * FROM product WHERE id = ?";
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(SELECT_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String describe = rs.getString("describe");
                String manufacturer = rs.getString("manufacturer");
                int id_category = rs.getInt("id_category");
                return new Product(id, name, price, describe, manufacturer, id_category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }



}

