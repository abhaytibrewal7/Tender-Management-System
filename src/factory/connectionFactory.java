package factory;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;

public class connectionFactory {
	private static connectionFactory instance=new connectionFactory();
	
	String url="jdbc:mysql://localhost:3306/tender";
	String user="root";
	String password="";
	
	String driverClass="com.mysql.jdbc.Driver";

	public connectionFactory() {
		try{
			Class.forName(driverClass);
			}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public static connectionFactory getInstance(){
		return instance;
	}
	public Connection getConnection(){
		Connection connection=null;
		try{
			connection=DriverManager.getConnection(url,user,password);
		}catch(Exception e){
			e.printStackTrace();
		}
		return connection;
	}
	
}
