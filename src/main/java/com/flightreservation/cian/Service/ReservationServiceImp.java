package com.flightreservation.cian.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.flightreservation.cian.Controller.ReservationController;
import com.flightreservation.cian.Entities.Flight;
import com.flightreservation.cian.Entities.Passenger;
import com.flightreservation.cian.Entities.Reservation;
import com.flightreservation.cian.Repositories.FlightRepository;
import com.flightreservation.cian.Repositories.PassengerRepository;
import com.flightreservation.cian.Repositories.ReservationRepository;
import com.flightreservation.cian.Util.EmailUtil;
import com.flightreservation.cian.Util.PDFGenerator;
import com.flightreservation.cian.dto.ReservationRequest;


@Component
public class ReservationServiceImp implements ReservationService {

	@Value("${com.flightreservation.cian.itinerary.dirpath}")
	private String ITINERARY_DIR = "C:\\Users\\P1025XPH1\\AngularSpringMongo\\Case Study\\flightreservation\\reseravation\\";
	
	@Autowired
	FlightRepository flightRepository;
	
	@Autowired
	PassengerRepository passengerRepository;
	
	@Autowired
	ReservationRepository reservationRepository;
	
	@Autowired
	PDFGenerator pdfGenerator;
	
	@Autowired
	EmailUtil emailUtil;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ReservationServiceImp.class);
	
	@Override
	@Transactional
	public Reservation bookFlight(ReservationRequest request) {
	
		LOGGER.info("Inside bookFlight()");
		
		Long flightId = request.getFlightId();
		LOGGER.info("Fetching flight for flight id: " + flightId );
		Flight flight = flightRepository.findById(flightId).get();
		
		Passenger passenger = new Passenger();
		passenger.setFirstName(request.getPassengerFirstName());
		passenger.setLastName(request.getPassengerLastName());
		passenger.setPhone(request.getPassengerPhone());
		passenger.setEmail(request.getPassengerEmail());
		LOGGER.info("Saving the passenger: " + passenger);
		Passenger savedPassenger = passengerRepository.save(passenger);
		
		Reservation reservation = new Reservation();
		reservation.setFlight(flight);
		reservation.setPassenger(savedPassenger);
		reservation.setCheckedIn(false);

		LOGGER.info("Saving the reservation: "+ reservation);
		Reservation savedReservation = reservationRepository.save(reservation);		

		String filepath = ITINERARY_DIR + savedReservation.getId()+".pdf";		
		
		LOGGER.info("Generating the Itinerary");
		pdfGenerator.generateItineray(savedReservation, filepath);
		LOGGER.info("Sending Itinerary");
		emailUtil.sendItinerary(passenger.getEmail(), filepath);
		
		return savedReservation;
	}

}
