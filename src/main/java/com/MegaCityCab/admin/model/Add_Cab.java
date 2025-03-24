package com.MegaCityCab.admin.model;

public class Add_Cab {
    private int id;
    
    private String category;
    private String regNumber;
    private String model;
    private String plateNumber;
    private String fare;
    private String driverName;
    private String driverLicense;
    private String driverContact;
    private String driverAddress;
    private String image;
    private String status;  // If needed

    // Constructor with parameters
	    public Add_Cab(int id, String category, String regNumber, String model, String plateNumber, 
	            String fare, String image, String driverName, String driverLicense, 
	            String driverContact, String driverAddress) {
	 this.id = id;
	 this.category = category;
	 this.regNumber = regNumber;
	 this.model = model;
	 this.plateNumber = plateNumber;
	 this.fare = fare;
	 this.image = image;
	 this.driverName = driverName;
	 this.driverLicense = driverLicense;
	 this.driverContact = driverContact;
	 this.driverAddress = driverAddress;
	}


    // Getters and setters for each field (optional, but recommended)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
	
	public String getCategory() {
        return category;
    }

	public void setCategory(String category) {
        this.category = category;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getFare() {
        return fare;
    }

    public void setFare(String fare) {
        this.fare = fare;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getDriverLicense() {
        return driverLicense;
    }

    public void setDriverLicense(String driverLicense) {
        this.driverLicense = driverLicense;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
    