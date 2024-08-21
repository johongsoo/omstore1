package com.web.spring;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Oracle {

	    public static void main(String[] args) {
	        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	        String username = "scott";
	        String password = "tiger";

	        try {
	            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
	            if (connection != null) {
	                System.out.println("Connected to the database!");
	                connection.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	}
	
}
