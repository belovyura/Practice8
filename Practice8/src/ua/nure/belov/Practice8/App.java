package ua.nure.belov.Practice8;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import ua.nure.belov.Practice8.entity.Client;

public class App {
	public static void main(String[] args) throws SQLException {
		
		Client client = new Client();
		client.setIdClient(1);
		client.setName("Jon");
		String inserClient = "insert into client(idclient, name) VALUES (?,?);";
		PreparedStatement ps = DBUtil.getConnection().prepareStatement(inserClient);
		ps.setInt(1, client.getIdClient());
		ps.setString(2, client.getName());
		ps.executeUpdate();
		
		
	}
	

}
