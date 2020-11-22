package com.saloon.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="booking")
public class Booking {
	
	@Id
    private	int btid;
    private int id;
    private String tid;
    private String username;
    @Column(name="cost")
    private String totalcost;
    private String fromlocation;
    private String tolocation;
    private int km;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bookingdate;
    private String temail;
	
    public String getTemail() {
		return temail;
	}
	public void setTemail(String temail) {
		this.temail = temail;
	}
	@Override
	public String toString() {
		return "Booking [btid=" + btid + ", id=" + id + ", tid=" + tid + ", username=" + username + ", cost=" + totalcost
				+ ", fromlocation=" + fromlocation + ", tolocation=" + tolocation + ", km=" + km + ", bookingdate="
				+ bookingdate + "]";
	}
	public int getBtid() {
		return btid;
	}
	public void setBtid(int btid) {
		this.btid = btid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCost() {
		return totalcost;
	}
	public void setCost(String cost) {
		this.totalcost = cost;
	}
	public String getFromlocation() {
		return fromlocation;
	}
	public void setFromlocation(String fromlocation) {
		this.fromlocation = fromlocation;
	}
	public String getTolocation() {
		return tolocation;
	}
	public void setTolocation(String tolocation) {
		this.tolocation = tolocation;
	}
	public int getKm() {
		return km;
	}
	public void setKm(int km) {
		this.km = km;
	}
	public Date getBookingdate() {
		return bookingdate;
	}
	public void setBookingdate(Date bookingdate) {
		this.bookingdate = bookingdate;
	}
}
