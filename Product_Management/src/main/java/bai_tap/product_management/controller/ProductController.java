package bai_tap.product_management.controller;

import bai_tap.product_management.entity.Product;
import bai_tap.product_management.repository.IProductRepository;
import bai_tap.product_management.service.IProductService;
import bai_tap.product_management.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", urlPatterns = "/products" )
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String action = req.getParameter("action");
       if (action==null){
           action= "";
       }
       switch (action){
           case "add":
               showForAdd(req,resp);
               break;
           case "delete":
               break;
           default:
               showList(req,resp);
       }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        req.setAttribute("productList",productList);
        req.getRequestDispatcher("/WEB-INF/views/list.jsp").forward(req,resp);
    }

    private void showForAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/add.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "add":
                save(req,resp);
                break;
            case "delete":
                deleteProduct(req,resp);
                break;
            default:

        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int deleteId = Integer.parseInt(req.getParameter("id"));
        productService.deleteById(deleteId);
        resp.sendRedirect("/products?mess=Delete success");
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String describe = req.getParameter("describe");
        String manufacturer = req.getParameter("manufacturer");
        Product product = new Product(id,name,price,describe,manufacturer);
        productService.add(product);
        resp.sendRedirect("/products?mess=created success");
    }
}
