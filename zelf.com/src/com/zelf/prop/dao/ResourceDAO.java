package com.zelf.prop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zelf.DBhelper.ZelfDBquery;
import com.zelf.exceptions.ZelfGenericException;
import com.zelf.prop.model.Resource;
import com.zelf.testing.ZelfDBConnection;

public class ResourceDAO {
	private Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
	private Connection connection = null;
	private PreparedStatement statement = null;
	private ResultSet resultSet = null;
	private ZelfDBquery query;

	public ResourceDAO() {
		ApplicationContext context = new ClassPathXmlApplicationContext("queries.xml");
		query = (ZelfDBquery) context.getBean("SQLFetch");
	}

	public boolean insertData(Resource resource) throws ClassNotFoundException, SQLException, ZelfGenericException {
		connection = ZelfDBConnection.createConnection();
		Statement selStatement = connection.prepareStatement(query.getCheckUsername());
		statement = connection.prepareStatement(query.getInsertResource());
		resultSet = selStatement.executeQuery(query.getCheckUsername());
		boolean userFound = false;
		while (resultSet.next()) {

			if (resultSet.getString("username").equals(resource.getUsername())) {
				System.out.println(resource.getUsername());
				System.out.println("DB" + resultSet.getString("username"));
				userFound = true;
				log.info("Vistor with USERNAME already exists in Database");
				break;
			}
		}
		if (userFound == false) {
			statement.setString(1, resource.getFirstname());
			statement.setString(2, resource.getLastname());
			statement.setString(3, resource.getUsername());
			statement.setString(4, resource.getPassword());
			statement.setString(5, resource.getEmail());
			statement.setString(6, resource.getGender());
			statement.setString(7, resource.getPhonenumber());
			statement.setString(8, resource.getDob());
			statement.setString(9, resource.getAddress());
			int status = statement.executeUpdate();
			if (status <= 0)
				throw new ZelfGenericException("Records not updated properly", new Exception());
			log.info("resource details inserted into Database");
			ZelfDBConnection.closeConnection();
		}
		resultSet.close();
		ZelfDBConnection.closeConnection();
		return userFound;
	}
	
	public Resource retrieveData(String username, String password) throws ClassNotFoundException, SQLException
	{
		connection = ZelfDBConnection.createConnection();
		statement = connection.prepareStatement(query.getSearchResource());
		statement.setString(1, username);
		statement.setString(2, password);
		resultSet = statement.executeQuery();
		
		Resource resource = new Resource();
		while(resultSet.next())
		{
			resource.setResourceid(resultSet.getInt("resourceid"));
			resource.setFirstname(resultSet.getString("firstname"));
			resource.setLastname(resultSet.getString("lastname"));
			resource.setUsername(resultSet.getString("username"));
			resource.setEmail(resultSet.getString("email"));
			resource.setGender(resultSet.getString("gender"));
			resource.setDob(resultSet.getString("dob"));
			resource.setPhonenumber(resultSet.getString("phonenumber"));
			resource.setAddress(resultSet.getString("address"));
			resource.setBioInfo(resultSet.getString("bioInfo"));
		}
		resultSet.close();
		ZelfDBConnection.closeConnection();
		return resource;
		
	}
	
	public int updateData(Resource resource) throws ClassNotFoundException, SQLException
	{
		connection = ZelfDBConnection.createConnection();
		statement = connection.prepareStatement(query.getUpdateResource());
		statement.setString(1, resource.getFirstname());
		statement.setString(2, resource.getLastname());
		statement.setString(3, resource.getUsername());
		statement.setString(4, resource.getEmail());
		statement.setString(5, resource.getPhonenumber());
		statement.setString(6, resource.getAddress());
		statement.setString(7, resource.getBioInfo());
		statement.setInt(8, resource.getResourceid());
		
		int status = statement.executeUpdate();
		log.info("Updating visitor details in Database for Visitor ID :"
				+ resource.getResourceid());
		ZelfDBConnection.closeConnection();
		return status;
		
	}
	
}
