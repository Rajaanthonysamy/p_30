package com.saloon.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.saloon.service.UserService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	
	@Autowired
	private UserService service;
	//@ResponseBody
	public String hello() {
		return "welcome to home";
	}
	
	@RequestMapping("/save")
	public String save(@RequestParam String username,@RequestParam String firstname,@RequestParam String lastname,@RequestParam String password,@RequestParam String  useremail)
	{
		// User user=new User(username,firstname,lastname,password,useremail);
		 //service.saveuser(user);
		return "saved";
	}
}
