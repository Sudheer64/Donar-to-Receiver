/**
 * 
 */
package com.donortoreceiver.utils;

import java.util.UUID;

import org.springframework.stereotype.Component;

/**
 * @author Satish Nulaka
 *
 */
@Component("randomStringGenerator")
public class RandomStringGenerator {
	
	public String generateString() {
        String uuid = UUID.randomUUID().toString();
        return  uuid;
    }

}
