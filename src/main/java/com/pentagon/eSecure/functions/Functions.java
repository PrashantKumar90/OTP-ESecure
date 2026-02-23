package com.pentagon.eSecure.functions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.pentagon.eSecure.model.Company;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Component
public class Functions {

	// global utility

	private static final String SECRET_KEY = "MySuperSecretKey"; // 16 chars
	private final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	private final SecureRandom random = new SecureRandom();

	@Autowired
	private JavaMailSender mailSender;

	public String Otpgenrator() {
		SecureRandom random = new SecureRandom();
		int otp = 100000 + random.nextInt(900000);
		return String.valueOf(otp);
	}

	// Hash Password with SHA-256 we will add some salt to prevent the attack and to
	// create secure system
	public String encryptPasscode(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hashBytes = md.digest(password.getBytes());
			StringBuilder hexString = new StringBuilder();
			for (byte b : hashBytes) {
				String hex = Integer.toHexString(0xff & b);
				if (hex.length() == 1)
					hexString.append('0');
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	public void sendOtpEmail(String toEmail, String otp, String company) {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

			helper.setTo(toEmail);
			helper.setSubject("OTP Verification for Your Company Registration with eSecure");

			String htmlContent = """
					<html>
					<body style="font-family: Arial, sans-serif; color: #333; line-height: 1.6;">
					    <p>Dear <b>""" + company
					+ """

							<p>Thank you for choosing <b>eSecure</b> to register your company with us.</p>

							<p>To complete your registration and verify your email, please use the One-Time Password (OTP) given below:</p>

							<p style="font-size: 22px; font-weight: bold; color: #2E86C1; background: #f4f6f6; padding: 10px 15px; border-radius: 6px; display: inline-block; letter-spacing: 2px;">
							    """
					+ otp
					+ """
							    </p>

							    <p>This OTP is valid for <b>10 minutes</b>. Please do not share this code with anyone for security reasons.</p>

							    <p>If you did not initiate this registration, please ignore this message or contact our support team immediately.</p>

							    <br>
							    <p>Best Regards,<br>
							    <b>eSecure Registration Team</b><br>
							    support@esecure.com<br>
							    www.esecure.com
							    </p>
							</body>
							</html>
							""";
			helper.setText(htmlContent, true);
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			throw new RuntimeException("Failed to send OTP email", e);
		}
	}

	public void confirmationEmail(String toEmail, String company) {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

			helper.setTo(toEmail);
			helper.setSubject("OTP Verification for Your Company Registration with eSecure");

			String htmlContent = """
					<html>
					<body style="font-family: Arial, sans-serif; color: #333; line-height: 1.6;">
					    <p>Dear <b>""" + company
					+ """

							    <p>Thank you for registering with <b>eSecure.</b> Your account has been successfully created, and you can now access our platform.</p>
							     <p>Here’s what you can do next:</p> <br>

							    		1. Log in to your account <br>

							    		2. Explore our services <br>

							    		3. Update your profile <br>
							    		<p>We’re excited to have you on board and look forward to helping you secure your digital operations efficiently.</p> <br>
							    		<p>If you have any questions or need assistance, our support team is always available: [Support Email/Link]</p>
							    <br>
							    <p>Best Regards,<br>
							    <b>eSecure Registration Team</b><br>
							    support@esecure.com<br>
							    www.esecure.com
							    </p>
							</body>
							</html>
							""";
			helper.setText(htmlContent, true);
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			throw new RuntimeException("Failed to send OTP email", e);
		}
	}

	// API Keys for sent on Email and it will save into DB and you can access it on
	// your Admin dashboard
	// it should be unique and the Unique Logic will implement later For time been
	// it will manage by the eSecure Admin Means Supper Admin ;

	// this is for generate key
	public String generateAPKeys() {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 16; i++) {
			int index = random.nextInt(CHARACTERS.length());
			sb.append(CHARACTERS.charAt(index));
		}

		return sb.toString();
	}

	// Enctyption of App Passcode

	public String encrypt(String data) {
		try {
			SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			return Base64.getEncoder().encodeToString(cipher.doFinal(data.getBytes()));
		} catch (Exception e) {
			throw new RuntimeException("Error while encrypting", e);
		}
	}

	// decryption of App Passcode
	public String decrypt(String encryptedData) {
		try {
			SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			return new String(cipher.doFinal(Base64.getDecoder().decode(encryptedData)));
		} catch (Exception e) {
			throw new RuntimeException("Error while decrypting", e);
		}
	}

	public void apiKeygenerationEmail(String email, String company) {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

			helper.setTo(email);
			helper.setSubject("API key Generated - eSecure");

			String htmlContent = """
					<html>
					<body style="font-family: Arial, sans-serif; color: #333; line-height: 1.6;">
					    <p>Dear <b>""" + company
					+ """
							    <p> Your API has been successfully created, and you can now access our platform.</p>
							        	<p>If you did NOT request or authorize this API key, please contact our support team immediately so we can secure your account.</p> <br>
							    		<p>For security reasons, please keep your API key confidential and do not share it with anyone.</p>
							    <br>
							    <p>Thank you,<br>
							    <b>eSecure Team</b><br>
							    support@esecure.com<br>
							    www.esecure.com
							    </p>
							</body>
							</html>
							""";
			helper.setText(htmlContent, true);
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			throw new RuntimeException("Failed to send OTP email", e);
		}
	}

}
