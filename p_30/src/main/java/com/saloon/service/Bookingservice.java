package com.saloon.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.saloon.model.Booking;
import com.saloon.model.Truck;
import com.saloon.repository.BookingRepository;

@Service
@Transactional
public class Bookingservice {

	private BookingRepository bookingRepository;
	
	public Bookingservice(BookingRepository bookingRepository) {
		this.bookingRepository = bookingRepository;
	}

	public void savebooking(Booking booking)
	{
		bookingRepository.save(booking);
	}

	public Booking findByDateAndTid(String tid, java.util.Date bookingdate) {
		System.out.println(bookingRepository.findByTidAndBookingdate(tid,bookingdate));
		
		return bookingRepository.findByTidAndBookingdate(tid,bookingdate);
	}

	public Date findByBookingdate(Date bookingdate) {
		return bookingRepository.findByBookingdate(bookingdate);
		
	}
	public List<Booking> bookinghistory(int id)
	{
		List<Booking> book =new ArrayList<Booking>();
		for (Booking bookvar : bookingRepository.findAllById(id)) {
			book.add(bookvar);
			System.out.println(bookvar);
		}
		return book;
	}

	public void delete(int btid) {
		bookingRepository.deleteById(btid);
		
	}
	
}
