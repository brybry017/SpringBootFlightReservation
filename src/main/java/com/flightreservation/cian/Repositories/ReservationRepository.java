package com.flightreservation.cian.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flightreservation.cian.Entities.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

}
