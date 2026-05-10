package com.nbj.util;

import java.sql.*;

public class DatabaseUtil {

    private static final String URL = System.getenv("DB_URL") != null 
            ? System.getenv("DB_URL") 
            : "jdbc:mysql://localhost:3306/nbj_repair";

    private static final String USER = System.getenv("DB_USER") != null 
            ? System.getenv("DB_USER") : "root";

    private static final String PASSWORD = System.getenv("DB_PASSWORD") != null 
            ? System.getenv("DB_PASSWORD") : "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL Driver not found!");
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
