package com.zent.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.properties.EncryptableProperties;
import org.jasypt.util.password.BasicPasswordEncryptor;

public class Test {
	public static void main(String[] args) {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		 encryptor.setPassword("jasypt"); // could be got from web, env variable...
		 Properties props = new EncryptableProperties(encryptor);
		 try {
			props.load(new FileInputStream("/Volumes/Data/01.Data/www/Blog/blog-project-spring-mvc-master/src/main/resources/config.properties"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String datasourceUsername = props.getProperty("jdbc.username");
		 String datasourcePassword = props.getProperty("jdbc.password");
		 System.out.println(datasourcePassword);
		 

	}
	
}
