package data.base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
		
		static Connection connection = null;
		
		public static Connection connect() throws SQLException, ClassNotFoundException {
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?" + "user=root&password=");
				System.out.println("Connecté");
			}catch(SQLException ex) {
				System.out.println("SQLException : " + ex.getMessage());
				System.out.println("SQLState : " + ex.getSQLState());
				System.out.println("VendorError : " + ex.getErrorCode());
			}
			
			return connection;
		}
}
