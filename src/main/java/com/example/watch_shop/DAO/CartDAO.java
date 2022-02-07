package com.example.watch_shop.DAO;

import com.example.watch_shop.Connection.ConnectionDB;
import com.example.watch_shop.DTO.CartDTO;
import com.example.watch_shop.DTO.ProductDTO;

import java.sql.*;
import java.util.ArrayList;

public class CartDAO {
    static ConnectionDB conn = new ConnectionDB();

    public ArrayList<CartDTO> getAllCart(int id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ArrayList<CartDTO> listCart = new ArrayList<>();
        ResultSet rs = conn.SQLQuery("SELECT * FROM cart WHERE AccID = "+id+" AND CartStatus = 1");
        while (rs.next()) {
            CartDTO dto = new CartDTO();
            dto.setId(rs.getInt(1));
            dto.setACid(rs.getInt(2));
            dto.setPCid(rs.getInt(3));
            dto.setQuanity(rs.getInt(4));
            dto.setStatus(rs.getInt(5));

            listCart.add(dto);
        }
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
            String query = "UPDATE cart SET CartQuanity= "+(quanity + 1)+" WHERE ProductID="+ProductID+" AND AccID="+AccID;
            conn.SQLNonQuery(query);
        } else {
            String query = "INSERT INTO cart VALUES ("+0+","+AccID+","+ProductID+",1,1)";
            conn.SQLNonQuery(query);
        }
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
        int quanity = getQuanity(ProductID, AccID);
        if (Operator.equals("+")) {
            quanity++;
        } else {
            quanity--;
        }
        String query = "UPDATE cart SET CartQuanity= "+quanity+" WHERE ProductID="+ProductID+" AND AccID="+AccID;
        conn.SQLNonQuery(query);
    }
    public void Checkout(int AccID) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        String query = "UPDATE cart SET CartStatus= 2 WHERE CartStatus=1 AND AccID="+AccID;
        conn.SQLNonQuery(query);
    }
}
