package com.zelf.prop.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zelf.prop.model.Resource;
import com.zelf.prop.service.ResourceInteraction;
import com.zelf.prop.service.ResourceServices;

@Controller
public class ResourceController {
	private static Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homePage()
	{
		return new ModelAndView("login");
 	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Register");
		return mv;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}

	@RequestMapping(value = "/logon", method = RequestMethod.POST)
	public ModelAndView registerResource(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		String firstname = request.getParameter("first_name");
		String lastname = request.getParameter("last_name");
		String username = request.getParameter("user_name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String gender = "";
		if (request.getParameter("gender").equals("male")) {
			gender = "Male";
		} else if (request.getParameter("gender").equals("female")) {
			gender = "female";
		}

		String phonenumber = request.getParameter("phone");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");

		Resource resource = new Resource();
		resource.setFirstname(firstname);
		resource.setLastname(lastname);
		resource.setUsername(username);
		resource.setPassword(password);
		resource.setEmail(email);
		resource.setGender(gender);
		resource.setPhonenumber(phonenumber);
		resource.setDob(dob);
		resource.setAddress(address);

		ResourceInteraction registering = new ResourceServices();
		boolean insertStatus = registering.resourceRegisteration(resource);
		if (insertStatus == false) {
			mv.addObject("REGSTATUS", "Hey! " + firstname + " Your now a member in Zelf!");
			log.info("Succesfully created visitor " + username);
			mv.setViewName("/login");
		} else {
			mv.addObject("REGSTATUS", "USERNAME already exists! .Try different One");
			log.info("Username " + username + " already exists and visitor creation failed..");
			mv.setViewName("/Register");
		}
		return mv;
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public ModelAndView loginResource(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		String username = request.getParameter("USERNAME");
		String password = request.getParameter("PASSWORD");

		Resource res = new Resource();
		ResourceInteraction logingIn = new ResourceServices();
		res = logingIn.resourceLogin(username, password);
		if (res.getUsername() != null) {
			mv.addObject("resource", res);
			mv.setViewName("home");
		} else {
			mv.addObject("ERROR", "Invalid Login Credentials");
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping(value = "/updateMyProfile", method = RequestMethod.POST)
	public ModelAndView updateMyProfile(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		String resourceId = request.getParameter("resource_id");
		String firstname = request.getParameter("first_name");
		String lastname = request.getParameter("last_name");
		String username = request.getParameter("user_name");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phone");
		String address = request.getParameter("address");
		String bioInfo = request.getParameter("bioInfo");
		System.out.println(resourceId + " " + firstname + " " + lastname + " " + username + " " + phonenumber + " "
				+ email + " " + address + " " + bioInfo);

		Resource resource = new Resource();
		ResourceInteraction resUpdate = new ResourceServices();
		resource.setResourceid(Integer.parseInt(resourceId));
		resource.setFirstname(firstname);
		resource.setLastname(lastname);
		resource.setUsername(username);
		resource.setEmail(email);
		resource.setPhonenumber(phonenumber);
		resource.setAddress(address);
		resource.setBioInfo(bioInfo);
		int status = resUpdate.resourceUpdate(resource);
		if (status > 0) {
			mv.addObject("status", "success");
			mv.setViewName("home");
		} else {
			mv.addObject("updatestatus", "Error in updation.. Please Check fields and retry");
			mv.setViewName("home");
		}
		return mv;

	}

}
