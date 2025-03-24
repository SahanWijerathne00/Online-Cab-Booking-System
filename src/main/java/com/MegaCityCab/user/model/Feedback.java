package com.MegaCityCab.user.model;

public class Feedback {
    private String customerId;
    private String customerName;
    private int rating;
    private String message;

    public Feedback(String customerId, String customerName, int rating, String message) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.rating = rating;
        this.message = message;
    }

    // Getters and Setters
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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
