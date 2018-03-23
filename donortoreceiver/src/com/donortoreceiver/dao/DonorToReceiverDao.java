/**
 * 
 */
package com.donortoreceiver.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.donortoreceiver.beans.ReceiverMessage;
import com.donortoreceiver.beans.Transactions;
import com.donortoreceiver.beans.UserDetails;
import com.donortoreceiver.mappers.TransactionsMapper;
import com.donortoreceiver.mappers.UserdetailsMapper;
import com.donortoreceiver.utils.RandomStringGenerator;

/**
 * @author Satish Reddy
 *
 */
@Component("donorToreceiverDao")
public class DonorToReceiverDao implements IDonorToReceiverDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	RandomStringGenerator randomStringGenerator;
	@Override
	public Boolean login(String userName, String password) {

		


		int count=0;
		String query = "Select count(*) from login_master where user_name = ? and password=?";
		try {
			Object[] params = new Object[] { userName, password };
			count = jdbcTemplate.queryForInt(query,params);
		} catch (DataAccessException e) {
			e.printStackTrace();
			count =0;
		} catch (Exception e) {
			e.printStackTrace();
			count = 0;
		}
		System.out.println("login count = "+count);
		return count == 1 ? true:false;
	}
	@Override
	public Boolean addUserDetais(UserDetails userDetails) {
		String sql = "insert into login_master(user_name,password,updated) values(?,?,NOW())";
		String query = " INSERT INTO users_master (user_name, first_name, lastname, email, dob, phone, city, country)" + 
				" VALUES (?,?,?,?,?,?,?,?)";
		Object[] params = null;
		int updated = 0;
		try {
				params = new Object[] {userDetails.getEmail(),userDetails.getPassword()};
				updated = jdbcTemplate.update(sql, params);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		try {
			if(updated ==1) {
				params = new Object[] {userDetails.getEmail(),userDetails.getFirstName(),userDetails.getLastName(),userDetails.getEmail()
				,userDetails.getDob(),userDetails.getPhone(),userDetails.getCity(),userDetails.getCountry()};
				updated = jdbcTemplate.update(query, params);
			}
		
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return updated==1?true:false;
	}
	@Override
	public Boolean updateUserdetails(UserDetails userDetails) {
		int isUpdated = 0;
		String sql = "update users_master set first_name =?,lastname=?,dob=?,phone=?,city=?,country=? where user_name=?";
		try {
			Object[] params = new Object[] {userDetails.getFirstName(),userDetails.getLastName(),userDetails.getDob(),userDetails.getPhone()
					,userDetails.getCity(),userDetails.getCountry(),userDetails.getEmail()};
			isUpdated = jdbcTemplate.update(sql, params);
		} catch (DataAccessException e) {
			isUpdated = 0;
			e.printStackTrace();
		}
		return isUpdated==1?true:false;
	}
	@Override
	public UserDetails getUserDetails(String userName) {
		String sql = "select first_name,lastname,email,dob,phone,city,country from users_master where user_name = ?";
		Object[] params = new Object[] {userName};
		UserDetails userdetails=null;
		try {
			userdetails = jdbcTemplate.queryForObject(sql,new UserdetailsMapper(),params);
		} catch (DataAccessException e) {	
			e.printStackTrace();
		}
		return userdetails;
	}
	@Override
	public List<Transactions> getContatcedList(String userName) {
		List<Transactions> list = null;
		String sql="select trs.receiver_details  receiver,trs.category category,trs.contactedon contacted," + 
				"um.first_name firstname,um.last_name lastname from transactions trs,users_master um" + 
				"where um.user_name = trs.receiver_details and trs.donor_name=?";
		try {
			Object[] params = new Object[] {userName};
			list = jdbcTemplate.query(sql, new TransactionsMapper(),params);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public String forgotPassword(String userName) {
		String password=randomStringGenerator.generateString();
		boolean bool=false;
		bool = updatePassword(userName, password);
		
		return bool?password:null;
	}
	@Override
	public boolean updatePassword(String userName,String password) {
		int i=0;
		String sql="update login_master set password=? where user_name=?";
		try {
			Object[] params = new Object[] {
					password,userName
			};
			i=jdbcTemplate.update(sql, params);
		} catch (DataAccessException e) {
			
			e.printStackTrace();
		}
		
		return i>0?true:false;
	}
	@Override
	public Boolean postMessage(ReceiverMessage receiverMessage) {
		int updated =0 ;
		
		String sql = "INSERT INTO receiver (category, message, username, name, phone) " + 
				"VALUES (?, ?, ?,?, ?)";
		Object[] params = new Object[] {receiverMessage.getCategory(),receiverMessage.getMessage(),
				receiverMessage.getUsername(),receiverMessage.getName(),receiverMessage.getPhone()};
		try {
			updated = jdbcTemplate.update(sql,params);
		} catch (DataAccessException e) {
			
			e.printStackTrace();
		}
		
		return updated == 1? true:false;
	}
	@Override
	public List<ReceiverMessage> getAllPosts(){
		
		String sql = "SELECT * FROM receiver";
	
		List<ReceiverMessage> Lposts = jdbcTemplate.query(sql,
				new BeanPropertyRowMapper(ReceiverMessage.class));
		
		System.out.println(Lposts);
		return Lposts;
	}

}
