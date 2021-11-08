package com.flightreservation.cian.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flightreservation.cian.Entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByEmail(String email);
}
