package bai_tap.product_management.entity;

public class Product {
    private int id;
    private String name;
    private Double price;
    private String describe;
    private String manufacturer;
    private int id_category;

    public Product() {
    }

    public Product(int id, String name, Double price, String describe, String manufacturer, int id_category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.manufacturer = manufacturer;
        this.id_category = id_category;
    }

    public Product(String name, double price, String describe, String manufacturer, int idCategory) {
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.manufacturer = manufacturer;
        this.id_category = id_category;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
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

    public int getId_category() {
        return id_category;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
    }
}
