package com.saloon.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.saloon.model.Truck;

public interface TruckRepository extends CrudRepository<Truck, String> {

	public List<Truck> findByLocation(String location);
	

}
