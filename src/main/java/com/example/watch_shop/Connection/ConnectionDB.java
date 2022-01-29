package com.example.watch_shop.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    /*Connect to My SQL
    * @param
    * String URL: use to import URL
    * String Name: used to import username
    * String Pass: used to import the password
    * */
    public static Connection connection(String url, String name, String pass) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
            Class.forName("org.postgresql.Driver").newInstance();
            Connection cnn = DriverManager.getConnection(url, name, pass);
        return cnn;
    }
}
