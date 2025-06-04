package bai_tap.product_management.repository;

import bai_tap.product_management.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"máy lạnh",20900009.0,"máy lạnh giúp bạn có một căng phòng mát nẻ để nghỉ ngơi giữa thời tiết nắng nóng này", "toyota"));
        productList.add(new Product(2,"máy phát điện",31331441.0,"bạn đang gặp sự cô mất điển hãy mua sản phẩm này để có thể phòng lúc bạn mất điện", "honda"));
        productList.add(new Product(3,"máy giặc",2029938.0,"bạn đang cảm thấy mệt mỏi khi phải giặc đồ bằng tay ? sản phẩm này sẽ giups bạn giặc đồ nhanh chóng tránh mất thời gian", "panasonic"));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void deleteById(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if(productList.get(i).getId()==id){
                productList.remove(i);
                break;
            }
        }
    }
}
