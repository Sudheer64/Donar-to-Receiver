/**
 * 
 */
package com.donortoreceiver.mailing;

/**
 * @author Satish Reddy
 *
 */
public class AuthenticationDetails {

	
	String userName;
	String password;
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "AuthenticationDetails [userName=" + userName + ", password=" + password + "]";
	}
	/**
	 * @param userName
	 * @param password
	 */
	public AuthenticationDetails(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}
	/**
	 * 
	 */
	public AuthenticationDetails() {
		super();
	}
	
	
}
