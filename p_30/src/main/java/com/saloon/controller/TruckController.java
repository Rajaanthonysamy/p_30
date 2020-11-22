package com.saloon.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.saloon.model.Truck;
import com.saloon.service.TruckService;
import com.saloon.service.UserService;

@Controller
@SessionAttributes({"truckid","cost","email"})
public class TruckController {
	
	@Autowired
	private TruckService truckservice;
	
	@RequestMapping("/truck")
	public String truck(HttpServletRequest req)
	{

		req.setAttribute("truck", truckservice.showalltrucks());
		req.setAttribute("mode","ALL_TRUCKS");
		return "home";
	}
	
	@RequestMapping("/book")
	public String book(@RequestParam String truckid,@RequestParam String email,HttpServletRequest req,Model model)
	{
		
		java.util.Optional<Truck> truck=truckservice.update(truckid);

		if(truck.isPresent())
		{
			req.setAttribute("truck",truck.get());
			req.setAttribute("mode", "BOOKING_MODE");
			model.addAttribute("truckid", truckid);
			model.addAttribute("email", email);
			return "home";
		}
		
		return "error";
	}
	@PostMapping("/search")
	public String searchlocation(@RequestParam String location,HttpServletRequest req)
	{
		req.setAttribute("truck", truckservice.searchlocation(location));
		req.setAttribute("mode", "SEARCH_MODE");
		return "home";
	}
}
