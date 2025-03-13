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
    private String image;         // New field
    private String licenseNumber; // New field
    private String plateNumber;   // New field
    private String address;       // New field
    private String status;        // New field

    public CabDetails(int id, String category, String description, String model, double rate, double fare,
                      String driverName, String contact, String image, String licenseNumber,
                      String plateNumber, String address, String status) {
        this.id = id;
        this.category = category;
        this.description = description;
        this.model = model;
        this.rate = rate;
        this.fare = fare;
        this.driverName = driverName;
        this.contact = contact;
        this.image = image;
        this.licenseNumber = licenseNumber;
        this.plateNumber = plateNumber;
        this.address = address;
        this.status = status;
    }

    // Getters and setters for all fields
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
