package com.example.watch_shop.DAO;

import com.example.watch_shop.Connection.ConnectionDB;
import com.example.watch_shop.DTO.ProductDTO;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductDAO {

    /*
    * Function use for get all product in db
    * */
    public ArrayList<ProductDTO> GetAllProduct() {
        ArrayList <ProductDTO> listProduct = new ArrayList<>();
        try {
            Statement stm = ConnectionDB.connection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0")
                    .createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM product");
            while (rs.next()){
                ProductDTO dto = new ProductDTO();
                dto.setProductID(rs.getInt(1));
                dto.setProductName(rs.getString(2));
                dto.setProductImg(rs.getString(3));
                dto.setProductBanner(rs.getString(4));
                dto.setProductDes(rs.getString(5));
                dto.setProductPrice(rs.getInt(6));
                dto.setProductStatus(rs.getInt(7));
                listProduct.add(dto);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProduct;
    }
}
