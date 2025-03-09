package com.MegaCityCab.user.model;

public class CabDetails {
    private int id;
    private String category;
    private String description;
    private String model;
    private double rate;
    private double fare;
    private String driverName;
    private String contact;

    public CabDetails(int id, String category, String description, String model, double rate, double fare, String driverName, String contact) {
        this.id = id;
        this.category = category;
        this.description = description;
        this.model = model;
        this.rate = rate;
        this.fare = fare;
        this.driverName = driverName;
        this.contact = contact;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public double getFare() {
		return fare;
	}

	public void setFare(double fare) {
		this.fare = fare;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

   
}
