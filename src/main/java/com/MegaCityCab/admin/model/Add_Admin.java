package com.MegaCityCab.admin.model;

import jakarta.servlet.http.Part;

public class Add_Admin {
	
	private int id;
    private String name;
    private String username;
    private String password;
    private String role;
    private String avatar;

    // Constructor
    public Add_Admin(int id, String name, String username, String password, String role, String avatar) {
    	this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.role = role;
        this.avatar = avatar;
    }

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

}