package com.MegaCityCab.user.model;

public class Cab {
    private int id;
    private String category;
    private String regNumber;
    private String model;
    private String plateNumber;
    private String driverName;
    private String image; // For cab image
    private String fare;

    // Getters and Setters

    public Cab(int id, String category, String regNumber, String model, String plateNumber, String driverName, String image, String fare,  String string) {
        this.id = id;
        this.category = category;
        this.regNumber = regNumber;
        this.model = model;
        this.plateNumber = plateNumber;
        this.driverName = driverName;
        this.image = image;
        this.fare = fare;
    }

    // Getters and setters
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

    public String getRegNumber() {
        return regNumber;
    }

    public void setRegNumber(String regNumber) {
        this.regNumber = regNumber;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getPlateNumber() {
        return plateNumber;
    }
    
    
    public String getFare() {
		return fare;
	}

	public void setFare(String fare) {
		this.fare = fare;
	}

	public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
