package edu.web.jstl01;

public class ContactVO {
	private String name;
	private String phone;
	private String email;
	public ContactVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ContactVO(String name, String phone, String email) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "ContactVO [name=" + name + ", phone=" + phone + ", email=" + email + "]";
	}
	
	
	
}
