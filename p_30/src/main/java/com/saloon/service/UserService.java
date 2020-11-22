package com.saloon.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.saloon.model.User;
import com.saloon.repository.UserRepository;

@Service
@Transactional
public class UserService {

	private UserRepository repository;
	public UserService(UserRepository repository) {
		this.repository = repository;
	}
	public void saveuser(User user)
	{
		repository.save(user);
	}
	
	public List<User> showallusers()
	{
		List<User> users=new ArrayList<User>();
		for (User user : repository.findAll()) {
			users.add(user);
		}
		return users;
	}
	
	
	public void delete(int id) {
		repository.deleteById(id);
		
	}
	public Optional<User> update(int id) {
		return repository.findById(id);
		
	}
	public User findByUseremailAndPassword(String useremail,String password)
	{
		
		
		return repository.findByUseremailAndPassword(useremail, password);
		
	}
}
