package com.MegaCityCab.admin.model;

public class Add_Category {
    private int id;
    private String categoryName;
    private String rate;
    private String description;
    private String status;

    // Constructor
    public Add_Category(int id, String categoryName, String rate, String description, String status) {
        this.id = id;
        this.categoryName = categoryName;
        this.rate = rate;
        this.description = description;
        this.status = status;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
    
    public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
