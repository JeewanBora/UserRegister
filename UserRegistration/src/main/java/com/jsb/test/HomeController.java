package com.jsb.test;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.hibernate.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	SessionFactory factory=new AnnotationConfiguration().configure("hibernate.cfg.xml").buildSessionFactory();  
    Session session=factory.openSession(); 
    
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		
		
		return "registration";
	}
	
	
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@Transactional
	public @ResponseBody ResponseObject saveData(@RequestBody RegisterBean rbean)
	{
		ResponseObject rsobj=new ResponseObject();
		Transaction tx = session.beginTransaction();
	    rbean.setDob(rbean.getDob().substring(0,10));
		session.merge(rbean);
		System.out.println(rbean);
		session.flush();
		tx.commit();
		
			rsobj.setStatus("success");			
		
		

		return rsobj;
	}

	
	
	
}
