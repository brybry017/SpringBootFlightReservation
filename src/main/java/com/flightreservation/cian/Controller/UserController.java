package com.flightreservation.cian.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.flightreservation.cian.Entities.User;
import com.flightreservation.cian.Repositories.UserRepository;
import com.flightreservation.cian.Service.SecurityService;
@Controller
public class UserController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private SecurityService securityService;
	
	private Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private BCryptPasswordEncoder encoder;

	
	
	@RequestMapping("/showReg")
	public String showRegistrationPage() {
		LOGGER.info("Inside showRegistrationPage()");
		return "login/registerUser";
	}
	@RequestMapping("/showLogin")
	public String showLoginPage() {
		LOGGER.info("Inside showLoginPage()");
		return "login/login";
	}	
	@RequestMapping("/showHome")
	public String showHomePage() {
		return "index";
	}
	
	@RequestMapping(value = "registerUser" , method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user) {
		LOGGER.info("Inside register()");
		user.setPassword(encoder.encode(user.getPassword()));
		userRepository.save(user);
		return "login/login";
	}
	
	@RequestMapping(value = "/login" , method = RequestMethod.POST)
	public String login(@RequestParam("email") String email , @RequestParam("password") String password, ModelMap modelMap) {
		
		
		boolean loginResponse = securityService.login(email, password);
		LOGGER.info("Inside login() and the email is: " +email);
		if(loginResponse) {
			return "findFlights";
		}else {
			modelMap.addAttribute("msg", "Invalid username or password . Pls try again");
		}
		return "login/login";
	}
}
