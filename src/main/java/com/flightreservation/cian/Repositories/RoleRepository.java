package com.flightreservation.cian.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flightreservation.cian.Entities.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

}
