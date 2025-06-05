package bai_tap.product_management.controller;

import bai_tap.product_management.dto.ProductDto;
import bai_tap.product_management.entity.Category;
import bai_tap.product_management.entity.Product;
import bai_tap.product_management.repository.IProductRepository;
import bai_tap.product_management.service.CategoryService;
import bai_tap.product_management.service.ICategoryService;
import bai_tap.product_management.service.IProductService;
import bai_tap.product_management.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", urlPatterns = "/products")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showForAdd(req, resp);
                break;
            case "delete":
                break;
            case "detail":
                showDetail(req, resp);
                break;
            case "search":
                searchByName(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            default:
                showList(req, resp);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDto> productList = productService.findAll();
        req.setAttribute("productList", productList);
        req.getRequestDispatcher("/WEB-INF/views/list.jsp").forward(req, resp);
    }

    private void showForAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("categoryList", categoryService.findALL());
        req.getRequestDispatcher("/WEB-INF/views/add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            case "update":
                updateProduct(req, resp);
                break;

            default:

        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int deleteId = Integer.parseInt(req.getParameter("deleteId"));
        boolean isDeleteSuccess = productService.deleteById(deleteId);
        String mess = "Deleted success";
        if (!isDeleteSuccess) {
            mess = "Not deleted success";
        }
        resp.sendRedirect("/products?mess=" + mess);
    }


    private void save(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String describe = req.getParameter("describe");
        String manufacturer = req.getParameter("manufacturer");
        int id_category = Integer.parseInt(req.getParameter("id_category"));
        Product products = new Product(name, price, describe, manufacturer, id_category);
        boolean isAddSuccess = productService.add(products);
        String mess = "created success";
        if (!isAddSuccess) {
            mess = "not created success";
        }
        resp.sendRedirect("/products?mess=" + mess);
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String idParam = req.getParameter("id");
//
//
//                int id = Integer.parseInt(idParam);
//                Product product = productService.findById(id);
//                    req.setAttribute("product", product);
//                    req.getRequestDispatcher("/WEB-INF/views/detail.jsp").forward(req, resp);

    }

    private void searchByName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchName = req.getParameter("searchName");
        String searchCategory = req.getParameter("searchCategory");

        List<ProductDto> resultList = productService.searchByNameAndCategory(searchName, searchCategory);
        req.setAttribute("productList", resultList);
        req.getRequestDispatcher("/WEB-INF/views/list.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");

        if (idParam == null) {
            resp.sendRedirect("/products?mess=Thiếu ID sản phẩm");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            Product product = productService.findById(id);

            if (product == null) {
                resp.sendRedirect("/products?mess=Sản phẩm không tồn tại");
            } else {
                req.setAttribute("product", product);
                req.setAttribute("categoryList", categoryService.findALL());
                req.getRequestDispatcher("/WEB-INF/views/edit.jsp").forward(req, resp);
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect("/products?mess=ID không hợp lệ");
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String describe = req.getParameter("describe");
        String manufacturer = req.getParameter("manufacturer");
        int id_category = Integer.parseInt(req.getParameter("id_category"));

        Product product = new Product(id, name, price, describe, manufacturer, id_category);
        boolean isUpdateSuccess = productService.update(product);

        String mess = isUpdateSuccess ? "Update thành công" : "Update thất bại";
        resp.sendRedirect("/products?mess=" + mess);
    }


}
