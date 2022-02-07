package com.example.watch_shop.Connection;

import java.sql.*;

public class ConnectionDB {
    /*Connect to My SQL
    * @param
    * String URL: use to import URL
    * String Name: used to import username
    * String Pass: used to import the password
    * */
    public ResultSet SQLQuery(String query) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection cnn = DriverManager.getConnection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0");
        PreparedStatement stm = cnn.prepareStatement(query);
        ResultSet rs = stm.executeQuery();
        cnn.close();
        return rs;
    }
    public void SQLNonQuery(String query) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection cnn = DriverManager.getConnection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0");
        PreparedStatement stm = cnn.prepareStatement(query);
        stm.executeUpdate();
        cnn.close();
    }
}
