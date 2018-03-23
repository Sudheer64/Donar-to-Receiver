/**
 * 
 */
package com.donortoreceiver.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.donortoreceiver.beans.Transactions;
import com.donortoreceiver.extractors.TransactionsExtractor;

/**
 * @author Satish Reddy
 *
 */
public class TransactionsMapper implements RowMapper<Transactions> {

	@Override
	public Transactions mapRow(ResultSet resultSet, int arg1) throws SQLException {
		
		return new TransactionsExtractor().extractData(resultSet);
	}

}
