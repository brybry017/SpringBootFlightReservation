package com.flightreservation.cian.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flightreservation.cian.Entities.Passenger;

public interface PassengerRepository extends JpaRepository<Passenger, Long> {

}
