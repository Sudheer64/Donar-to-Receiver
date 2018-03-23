/**
 * 
 */
package com.donortoreceiver.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.donortoreceiver.beans.UserDetails;
import com.donortoreceiver.extractors.UserDetailsExtractor;

/**
 * @author Satish Reddy
 *
 */
public class UserdetailsMapper implements RowMapper<UserDetails> {

	@Override
	public UserDetails mapRow(ResultSet resultSet, int arg1) throws SQLException {
		
		return new UserDetailsExtractor().extractData(resultSet);
	}

}
