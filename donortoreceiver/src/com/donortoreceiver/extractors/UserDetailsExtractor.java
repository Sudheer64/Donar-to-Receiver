/**
 * 
 */
package com.donortoreceiver.extractors;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.donortoreceiver.beans.UserDetails;

/**
 * @author Satish Reddy
 *
 */
public class UserDetailsExtractor implements ResultSetExtractor<UserDetails> {

	@Override
	public UserDetails extractData(ResultSet resultSet) throws SQLException, DataAccessException {
		UserDetails userDetails = new UserDetails();
		try {
		userDetails.setCity(resultSet.getString("city"));
		userDetails.setEmail(resultSet.getString("email"));
		userDetails.setCountry(resultSet.getString("country"));
		userDetails.setLastName(resultSet.getString("lastName"));
		userDetails.setFirstName(resultSet.getString("first_Name"));
		userDetails.setDob(resultSet.getString("dob"));
		userDetails.setPhone(resultSet.getString("phone"));
		} catch (Exception e) {
			e.printStackTrace();
			userDetails = null;
		}
		
		return userDetails;
	}

}
