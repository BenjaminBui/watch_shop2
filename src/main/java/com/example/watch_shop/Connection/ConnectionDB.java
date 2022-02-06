package com.example.watch_shop.Connection;

import java.sql.*;

public class ConnectionDB {
    /*Connect to My SQL
    * @param
    * String URL: use to import URL
    * String Name: used to import username
    * String Pass: used to import the password
    * */
    public static Connection connection(String url, String name, String pass) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
            Class.forName("org.postgresql.Driver");
            Connection cnn = DriverManager.getConnection(url, name, pass);
        return cnn;
    }
}
