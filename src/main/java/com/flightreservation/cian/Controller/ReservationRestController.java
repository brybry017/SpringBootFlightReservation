package com.flightreservation.cian.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.flightreservation.cian.Entities.Reservation;
import com.flightreservation.cian.Repositories.ReservationRepository;
import com.flightreservation.cian.Util.PDFGenerator;
import com.flightreservation.cian.dto.ReservationUpdateRequest;

@RestController
@CrossOrigin(origins = "http://localhost:4200/")
public class ReservationRestController {

	@Autowired
	ReservationRepository reservationRepository;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ReservationRestController.class);

	@RequestMapping("/reservations/{id}")
	public Reservation findReservation(@PathVariable("id") Long id) {
		LOGGER.info("Inside findReservation() for id: "+id);
		System.out.println("HU");
		return reservationRepository.findById(id).get();
	}
	
	@RequestMapping("/reservations/")
	public Reservation updateReservation(@RequestBody ReservationUpdateRequest request) {
		System.out.println("HU2");
		LOGGER.info("Inside updateReservation() for " + request);
		LOGGER.info("HAHAHAHAHA" + request.toString());
		System.out.println(request.toString());
		Reservation reservation = reservationRepository.findById(request.getId()).get();
		reservation.setNumberOfBags(request.getNumberOfBags());
		reservation.setCheckedIn(request.getCheckedIn());
		LOGGER.info("Saving Reservation");
		return reservationRepository.save(reservation);
	}
	
}
