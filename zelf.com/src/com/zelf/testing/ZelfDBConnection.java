package com.zelf.testing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;

public class ZelfDBConnection {
	private static Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
	private static Connection connection = null;

	public static Connection createConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost/zelf", "root", "root");
		log.info("MySQL DB - connected");
		return connection;
	}

	public static void closeConnection() throws SQLException {
		log.info("MySQL DB - Disconnected");
		connection.close();
	}
}
