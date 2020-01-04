package com.zelf.exceptions;

import java.util.logging.Logger;

/**
 * <br/>
 * CLASS DESCRIPTION: <br/>
 * 
 * A customized Exception class that redirects how the ClassNotFoundException,
 * SQLException and Exception objects are handled in the application. <br/>
 * 
 *  @author krishna.kishore
 * 
 */
@SuppressWarnings("serial")
public class ZelfGenericException extends Exception {

	// LOGGER to handle custom exceptions
	private static Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);

	public ZelfGenericException(String message, Throwable object) {
		super(message, object);
		log.info("Exception Message is :" + message);
	}

}
