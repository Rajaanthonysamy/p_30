package com.saloon.repository;

import org.springframework.data.repository.CrudRepository;

import com.saloon.model.User;

public interface UserRepository extends CrudRepository<User,Integer>{
	public User findByUseremailAndPassword(String useremail,String password);


}
