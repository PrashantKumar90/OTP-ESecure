package com.pentagon.eSecure.service;

import java.util.Properties;

import org.springframework.stereotype.Service;

import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;

import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

	public void sendOtp(String toEmail, String otp, String fromEmail, String appPasscode) {

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, appPasscode);
			}
		});

		try {
			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail)); // USER EMAIL
			message.setSubject("Your OTP Code");
			message.setText("Your OTP is: " + otp);

			Transport.send(message);

		} catch (Exception e) {
			throw new RuntimeException("Email not sent: " + e.getMessage());
		}
	}

}
