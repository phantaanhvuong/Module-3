package bai_tap.product_management.dto;

public class ProductDto {
    private int id;
    private String name;
    private double price;
    private String describe;
    private String manufacturer;
    private String name_category;

    public ProductDto() {
    }

    public ProductDto(int id, String name, double price, String describe, String manufacturer, String name_category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.manufacturer = manufacturer;
        this.name_category = name_category;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getName_category() {
        return name_category;
    }

    public void setName_category(String name_category) {
        this.name_category = name_category;
    }
}
