package com.saloon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.saloon.model.Booking;
import com.saloon.model.User;
import com.saloon.service.UserService;

import antlr.collections.List;

@Controller
@SessionAttributes({"id","username","useremail"})
public class UserController {
	@Autowired
	private UserService userservice;
	
	@RequestMapping("/")
	public String welcome(HttpServletRequest req) {

		req.setAttribute("mode","MODE_HOME");
		return "welcome";
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest req)
	{
		req.setAttribute("mode","MODE_REGISTER");
		return "welcome";
	}
	
	@PostMapping("/saveuser")
	public String registeruser(@Valid @ModelAttribute("user") User user,BindingResult res,ModelMap map,HttpServletRequest req)
	{
		
		if(res.hasErrors())
		{
		    java.util.List<ObjectError> allErrors = res.getAllErrors();
		    for (ObjectError objectError : allErrors) {
				System.out.println(objectError);
			}
		    req.setAttribute("user", user);
		    req.setAttribute("mode","MODE_REGISTER");
			System.out.println("Error");
			return "welcome";
			
		}
		req.setAttribute("user", user);
		userservice.saveuser(user);
		req.setAttribute("mode","mode==MODE_LOGIN");
		return "welcome";
		

	}
	@PostMapping("/update")
	public String update(@ModelAttribute User user,BindingResult res,HttpServletRequest req)
	{
		userservice.saveuser(user);
		req.setAttribute("mode","mode==ALL_TRUCKS");//hvbquyerg8yr3gf8yqregfygrfyyfgrfhDhzdhd
		return "home";
	}
	
	@GetMapping("/showtrucks")
	public String alltruck(HttpServletRequest req)
	{
		req.setAttribute("users", userservice.showallusers());
		req.setAttribute("mode","ALL_USERS");
		return "welcome";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Integer id,HttpServletRequest req)
	{
		userservice.delete(id);
		req.setAttribute("users", userservice.showallusers());
		req.setAttribute("mode", "ALL_USERS");
		return "welcome";
	}
	
	
	
	@RequestMapping("/edit")
	public String editUser(int id,HttpServletRequest req) {
		//req.setAttribute("user", userservice.update(id));
		
		java.util.Optional<User> user=userservice.update(id);

		if(user.isPresent())
		{
			req.setAttribute("user",user.get());
			req.setAttribute("mode", "USER_EDIT");
			//req.setAttribute("users", userservice.showallusers());
			//req.setAttribute("mode", "ALL_USERS");
			return "home";  /////efKUEWTGFTEG FUYGFGEHDSBBVFDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
		}
		return "error";
	}
	
	@RequestMapping("/login")
	public String login(@ModelAttribute User user,HttpServletRequest req)
	{
		
		req.setAttribute("mode", "MODE_LOGIN");
		return "welcome";
	}
	
	
	@PostMapping("/loginuser")
	public String loginuser(@ModelAttribute User user,HttpServletRequest req,Model model)  //ckutdqasdrftgyhujiksedrftgyhujiotreserdtfyuiiuytrddfhgjkljbv frrfv frrfgv
	{	
		if((userservice.findByUseremailAndPassword(user.getUseremail(), user.getPassword())!=null))
		{	
		    int uid=userservice.findByUseremailAndPassword(user.getUseremail(), user.getPassword()).getId();
			String username= userservice.findByUseremailAndPassword(user.getUseremail(), user.getPassword()).getUsername();
			String useremail=(userservice.findByUseremailAndPassword(user.getUseremail(), user.getPassword()).getUseremail());
			model.addAttribute("id", uid);
			model.addAttribute("username", username);
			model.addAttribute("useremail",useremail);
			user.setId(uid);
			user.setUsername(username);
			user.setUseremail(useremail);
			
			req.setAttribute("user", user);
			req.setAttribute("mode","PAGE");
		return "home";
		}
		else {
			req.setAttribute("Error", "Invalid email password");
			req.setAttribute("mode", "MODE_LOGIN");
			return "welcome";
		}
	}
	
}
