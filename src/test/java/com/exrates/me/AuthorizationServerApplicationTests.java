package com.exrates.me;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

//@RunWith(SpringRunner.class)
//@SpringBootTest
public class AuthorizationServerApplicationTests {

	@Test
	public void contextLoads() throws UnsupportedEncodingException {

		System.out.println(BCrypt.checkpw("aa11223344","$2a$10$bb77EoH1DtjUPqVVgS8...WfKeOq2BtdKR2SO269YAgt9twoNQ1Ti"));

		System.out.println(BCrypt.checkpw("Telez1213$$$!","$2a$10$calxzFbcwK94sjrExs1rIu98lP6kLWh0EL30vX40j2PJ/IK/UsKUC"));

		String encode = URLEncoder.encode("http://localhost:8080/oauth/token?grant_type=password&username=iamlukashenko+u1@gmail.com&password=aa11223344", "UTF-8");
		System.out.println(encode);
	}



}
