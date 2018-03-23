/**
 * 
 */
package com.donortoreceiver.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.donortoreceiver.beans.ReceiverMessage;
import com.donortoreceiver.beans.UserDetails;
import com.donortoreceiver.dao.IDonorToReceiverDao;
import com.donortoreceiver.mailing.Contact;
import com.donortoreceiver.utils.DonorToReceiverUtils;

/**
 * @author Satish Reddy
 *
 */
@Component("donorToReceiverService")
public class DonorToReceiverService {
	@Autowired
	IDonorToReceiverDao donorToReceiverDao;
	@Autowired
	DonorToReceiverUtils donorToReceiverUtils;
	@Autowired
	Contact mail;
	public Boolean login(String userName, String password) {
		return  donorToReceiverDao.login(userName, password);
		
	}
	public UserDetails getUserDetails(String userName) {
		
		return donorToReceiverDao.getUserDetails(userName);
	}
	public boolean  addUser(String userName, String password,Model model) {
		
		boolean isUpdated = donorToReceiverDao.addUserDetais(donorToReceiverUtils.getObject(userName, password));
		return isUpdated;
		
		
	}
	public boolean update(UserDetails userDetail) {
		
		return donorToReceiverDao.updateUserdetails(userDetail);
	}
	public boolean forgotPassword(String email) {
		
		 String password = donorToReceiverDao.forgotPassword(email);
		 String template =null;
		try {
			template = donorToReceiverUtils.readTemplates("forgotPassword.txt");
		} catch (IOException e) {
		
			e.printStackTrace();
			return false;
		}
		 template =template.replace("{{UserName}}", email);
		 template= template.replace("{{password}}", password);
		 return mail.sendMail(email, "New password", email,template)?true:false;
		 
		
	}
	public boolean postMessage(ReceiverMessage receiverMessage) {
		
		return donorToReceiverDao.postMessage(receiverMessage);
	}
	public boolean updatePassword(String password, String userName) {
		
		return donorToReceiverDao.updatePassword(password,userName);
	}
public List<ReceiverMessage> getpostMessage() {
		
		return donorToReceiverDao.getAllPosts();
	}

}
