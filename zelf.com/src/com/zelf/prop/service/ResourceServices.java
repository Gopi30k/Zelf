package com.zelf.prop.service;

import java.sql.SQLException;
import java.util.logging.Logger;

import com.zelf.prop.dao.ResourceDAO;
import com.zelf.prop.model.Resource;

public class ResourceServices implements ResourceInteraction {
	private static Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);

	public boolean resourceRegisteration(Resource resource) {
		ResourceDAO resDao = new ResourceDAO();
		boolean insertStatus = false;
		try {
			insertStatus = resDao.insertData(resource);
			System.out.println("Service" + insertStatus);
		} catch (SQLException exception) {
			log.info("SQL Exception is :" + exception.getMessage());
		} catch (ClassNotFoundException exception) {
			log.info("CLASS NOT FOUND Exception is :" + exception.getMessage());
		} catch (Exception exception) {
			log.info("Exception is :" + exception.getMessage());
		}
		return insertStatus;
	}

	public Resource resourceLogin(String username, String password) {
		ResourceDAO resDao = new ResourceDAO();
		Resource resource = new Resource();
		try {
			resource = resDao.retrieveData(username, password);
		} catch (SQLException exception) {
			log.info("SQL Exception is :" + exception.getMessage());
		} catch (ClassNotFoundException exception) {
			log.info("CLASS NOT FOUND Exception is :" + exception.getMessage());
		}

		return resource;

	}
	
	public int resourceUpdate(Resource resource)
	{
		int status=0;
		ResourceDAO resDao = new ResourceDAO();
		try {
			status = resDao.updateData(resource);
		} catch (ClassNotFoundException exception) {
			log.info("Exception is :" + exception.getMessage());
		} catch (SQLException exception) {
			log.info("Exception is :" + exception.getMessage());
		}
		return status;
	}

}
