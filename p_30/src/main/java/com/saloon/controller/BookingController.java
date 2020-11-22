package com.saloon.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.saloon.model.Booking;
import com.saloon.model.Truck;
import com.saloon.service.Bookingservice;


@Controller
public class BookingController {

	@Autowired
	Bookingservice bookingservice;
	@PostMapping("/booking")
	public String booking(@ModelAttribute Booking booking,HttpServletRequest req) 
	
	{
		Date bookingdate2=booking.getBookingdate();
		System.out.println(bookingdate2);
		//System.out.println("check"+bookingservice.findByBookingdate(booking.getBookingdate()));
		
		//type cast
		java.sql.Date bookingdate = new java.sql.Date(bookingdate2.getTime());
		System.out.println(bookingdate);
		//System.out.println("function"+bookingservice.findByDateAndTid(booking.getTid(),booking.getBookingdate()).getBookingdate());
		if( bookingservice.findByDateAndTid(booking.getTid(),bookingdate)==null) 
		{
			bookingservice.savebooking(booking);
			req.setAttribute("mode", "BOOKED");
			return "booking";
		}
		else
		{
			req.setAttribute("mode", "CHOOSE_OTHER");
		req.setAttribute("error","Already booked choose other truck");
		return "booking";

		}
	}
	@GetMapping("/yourbookings")
	public String bookings(@RequestParam int id,HttpServletRequest req)
	{
		System.out.println(id);
		req.setAttribute("bookings", bookingservice.bookinghistory(id));
		req.setAttribute("mode", "BOOKING_HISTORY");
		return "home";
	}
	
	@RequestMapping("/cancel")
	public String cancel(@RequestParam int btid,@RequestParam int id,HttpServletRequest req)
	{
		bookingservice.delete(btid);
		//req.setAttribute("users", userservice.showallusers());
				//req.setAttribute("mode", "ALL_USERS");
		req.setAttribute("bookings", bookingservice.bookinghistory(id));
		req.setAttribute("mode", "BOOKING_HISTORY");
		return "home";
	}
	
	
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
