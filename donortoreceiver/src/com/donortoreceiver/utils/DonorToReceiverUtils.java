/**
 * 
 */
package com.donortoreceiver.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;


import org.springframework.stereotype.Component;

import com.donortoreceiver.beans.UserDetails;

/**
 * @author nulak
 *
 */
@Component("donorToReceiverUtils")
public class DonorToReceiverUtils {

	public UserDetails getObject(String userName,String password) {
		UserDetails  userDetails = new UserDetails();
		userDetails.setEmail(userName);
		userDetails.setPassword(password);
		return userDetails;
		
	}
	public String readTemplates(String templateType) throws IOException {
		
		return readTextFile(templateType);
	}
	public String readTextFile(String fileName) throws IOException {
		ClassLoader classLoader = getClass().getClassLoader();
        String content = readfile(new File(classLoader.getResource("forgotPassword.txt").getFile()));
        return content;
    }
	
	
	private String readfile(File file) {
		String str ="";
		String line =null;
		try {
           
            FileReader fileReader = 
                new FileReader(file);

           
            BufferedReader bufferedReader = 
                new BufferedReader(fileReader);

            while((line = bufferedReader.readLine()) != null) {
                str=str+"\n"+line;
            }   

           
            bufferedReader.close();         
        }
        catch(FileNotFoundException ex) {
            ex.printStackTrace();                
        }
        catch(IOException ex) {
            ex.printStackTrace();
        }
		return str;
	}

}
