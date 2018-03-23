/**
 * 
 */
package com.donortoreceiver.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.donortoreceiver.beans.ReceiverMessage;
import com.donortoreceiver.beans.UserDetails;
import com.donortoreceiver.service.DonorToReceiverService;

/**
 * @author Satish reddy
 *
 */
@Controller
public class DonorToReceiverController {

	@Autowired
	DonorToReceiverService donorToReceiverService;
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(Model model,@RequestParam("username") String userName,@RequestParam("password") String password,HttpSession session) {
		boolean bool = donorToReceiverService.login(userName, password);
		System.out.println("is login successful :"+bool);
		UserDetails userDetails=bool?donorToReceiverService.getUserDetails(userName):null;
		System.out.println("userdetails in controller :"+userDetails+"username : "+ userName+"   password:"+password);
		model.addAttribute("userdeatils", userDetails);
		model.addAttribute("detailsUpdate",userDetails);
		session.setAttribute("userName", userName);
		session.setAttribute("userdeatils", userDetails);
		if(userDetails == null) {
			model.addAttribute("error","invalid username or password");
		}
		return bool?"home":"index";
	}
	@RequestMapping(value="logout")
	public String logout(HttpSession session){
		session.invalidate();
		return"index";
	}
	@RequestMapping(value="signUp", method=RequestMethod.POST)
	@ResponseBody
	public String signUp(Model model,@RequestParam("email") String userName,@RequestParam("password") String password ) {
		boolean bool = donorToReceiverService.addUser(userName,password,model);
		
		return bool?"Success":"FAIL";
	}
	@RequestMapping(value="updatedetails")
	public String updatedetails(Model model,HttpSession session) {
		
		model.addAttribute("detailsUpdate",donorToReceiverService.getUserDetails(session.getAttribute("userName").toString()));
		model.addAttribute("updateDetails","updatedetails");
		return "home";
	}
	@RequestMapping(value="home")
	public String home(HttpSession session,Model model) {
		try {
			String userName = session.getAttribute("userName").toString();
			UserDetails userDetails=donorToReceiverService.getUserDetails(userName);
			model.addAttribute("userdeatils", userDetails);
			model.addAttribute("detailsUpdate",userDetails);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "index";
		}
		return "home";
	}
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(HttpSession session,Model model,@ModelAttribute("detailsUpdate") @Valid UserDetails userDetail) {
		
		try {
			String userName = session.getAttribute("userName").toString();
			userDetail.setEmail(userName);
			
			boolean bool =donorToReceiverService.update(userDetail);
			UserDetails userDetails=donorToReceiverService.getUserDetails(userName);
			model.addAttribute("userdeatils", userDetails);
			model.addAttribute("detailsUpdate",userDetails);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "index";
		}
		return "home";
	}
	
	@RequestMapping(value="forgotPassword", method=RequestMethod.POST)
	@ResponseBody
	public String forgotPassword(HttpServletRequest request,HttpServletResponse response) {
		String email = request.getParameter("emailId");
		boolean bool = donorToReceiverService.forgotPassword(email);
		
		return bool?"success":"FAIL";
	}
	@RequestMapping(value="message")
	public String message(Model model,HttpSession session) {
		try {
			String userName = session.getAttribute("userName").toString();
			model.addAttribute("userName",userName);
		model.addAttribute("message",new ReceiverMessage());
		}catch (Exception e) {
			return "index";
		}
		return "reciverPost";
	}
	@RequestMapping(value="receiverMessage", method=RequestMethod.POST)
	public String receiverMessage(Model model,@ModelAttribute("message") @Valid ReceiverMessage receiverMessage,
			HttpSession session,HttpServletRequest request) {
		
		try {
			
			if(receiverMessage.getName() == null || receiverMessage.getMessage() == null || 
					receiverMessage.getMessage().trim() =="" || receiverMessage.getName().trim() == "" ) {
				model.addAttribute("posted","Message and Name are mandatory fields");
				return "reciverPost";
			}
			String userName = session.getAttribute("userName").toString();
			String category = request.getParameter("category");
			receiverMessage.setUsername(userName);
			receiverMessage.setCategory(category);
			if(donorToReceiverService.postMessage(receiverMessage)) {
				model.addAttribute("posted","Message posted successfully");
			}else {
				model.addAttribute("posted","Internal server error please try again!!");
			}
			
			model.addAttribute("message",new ReceiverMessage());
		} catch (Exception e) {
			
			e.printStackTrace();
			return "index";
		}
		return "reciverPost";
	}
	@RequestMapping(value="updatePassword",method=RequestMethod.POST)
	@ResponseBody
	public String updatePassword(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		
		String password = request.getParameter("password");
		String userName = session.getAttribute("userName").toString();
		System.out.println("inisde controller : "+password +" "+userName);
		boolean bool = donorToReceiverService.updatePassword(userName,password);
		
		return bool?"success":"FAIL";
	}
	
	
	
	@RequestMapping(value="/posts",method = RequestMethod.GET)
	    public String listPosts(Model model)
	    {System.out.println("ndnfk");
	 

	        List postsList = donorToReceiverService.getpostMessage();
	        System.out.println(postsList);
	        model.addAttribute("postsList", postsList);
	        
	        return"posts";
	    }
	
	
	
}
