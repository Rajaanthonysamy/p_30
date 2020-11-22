package com.saloon.repository;





import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.saloon.model.Booking;
import com.saloon.model.Truck;

public interface BookingRepository extends CrudRepository<Booking, Integer> {

	public Booking findByTidAndBookingdate(String tid,Date bookingdate);

	public Date findByBookingdate(Date bookingdate);
	public List<Booking> findAllById(int id);

}
