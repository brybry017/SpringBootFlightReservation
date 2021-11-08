package com.flightreservation.cian.Service;

import com.flightreservation.cian.Entities.Reservation;
import com.flightreservation.cian.dto.ReservationRequest;

public interface ReservationService {

	public Reservation bookFlight(ReservationRequest request);

}
