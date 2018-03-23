/**
 * 
 */
package com.donortoreceiver.beans;

/**
 * @author nulak
 *
 */
public class Transactions {
	private String name;
	private String category;
	private String contactedOn;
	private String email;
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}
	/**
	 * @return the contactedOn
	 */
	public String getContactedOn() {
		return contactedOn;
	}
	/**
	 * @param contactedOn the contactedOn to set
	 */
	public void setContactedOn(String contactedOn) {
		this.contactedOn = contactedOn;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	public Transactions(String name, String category, String contactedOn, String email) {
		super();
		this.name = name;
		this.category = category;
		this.contactedOn = contactedOn;
		this.email = email;
	}
	public Transactions() {
		// TODO Auto-generated constructor stub
	}

}
