package back.calc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class extract {

	public static String total() {
		String totalS = null;
		try {
			Connection con = data.base.Connector.connect();
			PreparedStatement ps = con.prepareStatement("SELECT SUM(salaire) FROM employe");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				totalS = rs.getString(1);
			}
			con.close();
			
			return totalS;
			
			}catch (Exception e) {
			System.out.println("Erreur : " + e);
		}
		return totalS;
	}
	
	public static String minimun() {
		String minimum = null;
		try {
			Connection con = data.base.Connector.connect();
			PreparedStatement ps = con.prepareStatement("SELECT MIN(salaire) FROM employe");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				minimum = rs.getString(1);
			}
			con.close();
			
			return minimum;
			
			}catch (Exception e) {
			System.out.println("Erreur : " + e);
		}
		return minimum;
	}
	
	public static String maximum() {
		String maximum = null;
		try {
			Connection con = data.base.Connector.connect();
			PreparedStatement ps = con.prepareStatement("SELECT MAX(salaire) FROM employe");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				maximum = rs.getString(1);
			}
			con.close();
			
			return maximum;
			
			}catch (Exception e) {
			System.out.println("Erreur : " + e);
		}
		return maximum;
	}

}
