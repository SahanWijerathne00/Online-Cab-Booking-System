package com.MegaCityCab.user.model;


public class Booking {
    private String customerId;
    private String customerName;
    private String email;
    private String phoneNumber;
    private String pickup;
    private String drop;
    private String cabCategory;
    private String cabModel;
    private String plateNumber;
    private String bookingTime;
    private String paymentMethod;
    private double amount;
    private String driverName;
    private String driverContact;
    private String driverAddress;
    


    // Constructors, getters and setters
    public Booking(String customerId, String customerName, String email, String phoneNumber, String pickup, String drop, 
                   String cabCategory, String cabModel, String plateNumber, 
                   String bookingTime, String paymentMethod, double amount, String driverName, String driverContact, String driverAddress) {
    	this.customerId = customerId;
        this.customerName = customerName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.pickup = pickup;
        this.drop = drop;
        this.cabCategory = cabCategory;
        this.cabModel = cabModel;
        this.plateNumber = plateNumber;
        this.bookingTime = bookingTime;
        this.paymentMethod = paymentMethod;
        this.amount = amount;
        this.driverName = driverName;
        this.driverContact = driverContact;
        this.driverAddress = driverAddress;
    }

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPickup() {
		return pickup;
	}

	public void setPickup(String pickup) {
		this.pickup = pickup;
	}

	public String getDrop() {
		return drop;
	}

	public void setDrop(String drop) {
		this.drop = drop;
	}

	public String getCabCategory() {
		return cabCategory;
	}

	public void setCabCategory(String cabCategory) {
		this.cabCategory = cabCategory;
	}

	public String getCabModel() {
		return cabModel;
	}

	public void setCabModel(String cabModel) {
		this.cabModel = cabModel;
	}

	public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

	

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getDriverContact() {
		return driverContact;
	}

	public void setDriverContact(String driverContact) {
		this.driverContact = driverContact;
	}

	public String getDriverAddress() {
		return driverAddress;
	}

	public void setDriverAddress(String driverAddress) {
		this.driverAddress = driverAddress;
	}

	public void setStatus(String string) {
		// TODO Auto-generated method stub
		
	}
	
	

    
}
