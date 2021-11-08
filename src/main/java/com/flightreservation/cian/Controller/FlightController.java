package com.flightreservation.cian.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.flightreservation.cian.Entities.Flight;
import com.flightreservation.cian.Repositories.FlightRepository;

@Controller
public class FlightController {

	@Autowired
	FlightRepository flightRepository;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FlightController.class);
	
	@RequestMapping("findFlights")
	public String findFlights(@RequestParam("from") String from, @RequestParam("to") String to,
			@RequestParam("departureDate") @DateTimeFormat(pattern = "MM-dd-yyyy") Date departureDate,
			ModelMap modelMap) throws ParseException {
		
		System.out.println(from);
		System.out.println(to);
		System.out.println(departureDate);
	
		System.out.println(flightRepository.findFlights(from,to,departureDate).toString());
		System.out.println(flightRepository.findFlightsByDateofDeparture(departureDate));
		
		LOGGER.info("Info findFlights() From: " + from + " TO: " + to + " Departure Date: " + departureDate);
		List<Flight> flights = flightRepository.findFlights(from,to,departureDate);
		modelMap.addAttribute("flights", flights);
		LOGGER.info("Flight Found are: " + flights);
		return "displayFlights";
	}
	
	@RequestMapping("admin/showAddFlight")
	public String showAddFlight() {
		return "addFlight";
	}
}
