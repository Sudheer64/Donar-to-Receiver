/**
 * 
 */
package com.donortoreceiver.extractors;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.donortoreceiver.beans.Transactions;

/**
 * @author Satish Reddy
 *
 */
public class TransactionsExtractor implements ResultSetExtractor<Transactions> {

	@Override
	public Transactions extractData(ResultSet resultSet) throws SQLException, DataAccessException {
		Transactions transactions = new Transactions();
		try {
			transactions.setCategory(resultSet.getString("category"));
			transactions.setContactedOn(resultSet.getString("contacted"));
			transactions.setEmail(resultSet.getString("receiver"));
			transactions.setName(resultSet.getString("firstname")+" "+resultSet.getString("lastname"));
		} catch (Exception e) {
			e.printStackTrace();
			transactions = null;
		}
		return transactions;
	}

}
