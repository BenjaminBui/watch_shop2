package com.example.watch_shop.DAO;

import com.example.watch_shop.Connection.ConnectionDB;
import com.example.watch_shop.DTO.CartDTO;
import com.example.watch_shop.DTO.ProductDTO;

import java.sql.*;
import java.util.ArrayList;

public class CartDAO {

    public ArrayList<CartDTO> getAllCart(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ArrayList<CartDTO> listCart = new ArrayList<>();
        PreparedStatement stm = ConnectionDB.connection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0")
                .prepareStatement("SELECT * FROM cart WHERE AccID = ? AND CartStatus = ?");
        stm.setInt(1,id);
        stm.setInt(2,1);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            CartDTO dto = new CartDTO();
            dto.setId(rs.getInt(1));
            dto.setACid(rs.getInt(2));
            dto.setPCid(rs.getInt(3));
            dto.setQuanity(rs.getInt(4));
            dto.setStatus(rs.getInt(5));

            listCart.add(dto);
        }
        stm.close();
        rs.close();
        return listCart;
    }

    public ArrayList<ProductDTO> getItemByID(int AccID) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ArrayList<CartDTO> listCart = getAllCart(AccID);
        ArrayList<ProductDTO> listItem = new ArrayList<>();
        ProductDAO dao = new ProductDAO();
        for (CartDTO dtoCart :
                listCart) {
            for (ProductDTO dtoProduct :
                    dao.GetAllProduct()) {
                if (dtoProduct.getProductID() == dtoCart.getPCid()) {
                    listItem.add(dtoProduct);
                }
            }
        }
        return listItem;
    }

    public void AddToCart(int ProductID, int AccID) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Connection cnn = ConnectionDB.connection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0");
        boolean check = false;
        int quanity = 0;
        ArrayList<CartDTO> listCart = getAllCart(AccID);
        for (CartDTO dto :
                listCart) {
            if (dto.getPCid() == ProductID && dto.getACid() == AccID && dto.getStatus() == 1) {
                check = true;
                quanity = dto.getQuanity();
                break;
            } else {
                check = false;
            }
        }

        if (check) {
            PreparedStatement stm = cnn.prepareStatement("UPDATE cart SET CartQuanity= ? WHERE ProductID=? AND AccID=?");
            stm.setInt(1, quanity + 1);
            stm.setInt(2, ProductID);
            stm.setInt(3, AccID);
            stm.executeUpdate();
            stm.close();
        } else {
            PreparedStatement stm = cnn.prepareStatement("INSERT INTO cart VALUES (?,?,?,?,?)");
            stm.setInt(1, 0);
            stm.setInt(2, AccID);
            stm.setInt(3, ProductID);
            stm.setInt(4, 1);
            stm.setInt(5, 1);
            stm.executeUpdate();
            stm.close();
        }
        cnn.close();
    }

    public int getQuanity(int ProductID, int AccID) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ArrayList<CartDTO> listCart = getAllCart(AccID);
        for (CartDTO dto :
                listCart) {
            if (dto.getPCid() == ProductID && dto.getACid() == AccID) {
                return dto.getQuanity();
            }
        }
        return 0;
    }

    public void UpdateQuanity(int ProductID, int AccID, String Operator) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ArrayList<CartDTO> listCart = getAllCart(AccID);
        Connection cnn = ConnectionDB.connection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0");
        int quanity = getQuanity(ProductID, AccID);
        if (Operator.equals("+")) {
            quanity++;
        } else {
            quanity--;
        }
        PreparedStatement stm = cnn.prepareStatement("UPDATE cart SET CartQuanity= ? WHERE ProductID=? AND AccID=?");
        stm.setInt(1, quanity);
        stm.setInt(2, ProductID);
        stm.setInt(3, AccID);
        stm.executeUpdate();
        stm.close();
        cnn.close();
    }
    public void Checkout(int AccID) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Connection cnn = ConnectionDB.connection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0");
        PreparedStatement stm = cnn.prepareStatement("UPDATE cart SET CartStatus= ? WHERE CartStatus=1 AND AccID=?");
        stm.setInt(1, 2);
        stm.setInt(2, AccID);
        stm.executeUpdate();
        stm.close();
        cnn.close();
    }
}
