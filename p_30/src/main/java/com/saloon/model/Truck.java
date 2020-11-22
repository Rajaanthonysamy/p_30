package com.saloon.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="trucktable")
public class Truck {
	

	@Id
	private String truckid;
	private String location;
	private String capacity;
	private String type;
	private int cost;
	private int driver_salary;
	private String email;
	
	@Override
	public String toString() {
		return "Truck [truckid=" + truckid + ", location=" + location + ", capacity=" + capacity + ", type=" + type
				+ ", cost=" + cost + ", driver_salary=" + driver_salary + ", email=" + email + "]";
	}

	public Truck()
	{
		
	}
	
	public Truck(String truckid, String location, String capacity, String type, int cost, int driver_salary,
			String email) {

		this.truckid = truckid;
		this.location = location;
		this.capacity = capacity;
		this.type = type;
		this.cost = cost;
		this.driver_salary = driver_salary;
		this.email = email;
	}
	public String getTruckid() {
		return truckid;
	}
	public void setTruckid(String truckid) {
		this.truckid = truckid;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getDriver_salary() {
		return driver_salary;
	}
	public void setDriver_salary(int driver_salary) {
		this.driver_salary = driver_salary;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	} 
	
}
