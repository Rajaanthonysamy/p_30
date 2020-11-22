package com.saloon.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.saloon.model.Booking;
import com.saloon.model.Truck;
import com.saloon.repository.TruckRepository;


@Service
@Transactional
public class TruckService {
	
	private TruckRepository truckRepository;
	
	public TruckService(TruckRepository truckRepository) {
		this.truckRepository = truckRepository;
	}

	public List<Truck> showalltrucks()
	{
		List<Truck> truck=new ArrayList<Truck>();
		for (Truck tr : truckRepository.findAll()) {
			truck.add(tr);
		}
		return truck;
	}
	
	public Optional<Truck> update(String truckid) {
		return truckRepository.findById(truckid);
		
	}

	public List<Truck> searchlocation(String location) {
		List<Truck> truck =new ArrayList<Truck>();
		for (Truck tr : truckRepository.findByLocation(location)) {
			truck.add(tr);
			System.out.println(tr);
		}
		return truck;
	}
	

	
	
}
//Node[] shapesArray = shapes.toArray();
//for (Node node : shapesArray ){