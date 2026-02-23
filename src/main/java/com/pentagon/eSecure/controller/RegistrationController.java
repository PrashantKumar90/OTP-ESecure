package com.pentagon.eSecure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pentagon.eSecure.functions.Functions;
import com.pentagon.eSecure.model.Company;
import com.pentagon.eSecure.repository.DBService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class RegistrationController {

	// I will Create a registration service that will help the registration
	// component only and latter on I will create a global controller which is rest
	// controller then they will handle only urls and the urls cntrolles the intern

	@Autowired
	Functions functions;
	@Autowired
	DBService companySerrvice;

	long expiryTime = System.currentTimeMillis() + (10 * 60 * 1000); 

	@GetMapping("/")
	public String Home(Model model) {

		if (!model.containsAttribute("company")) {
			model.addAttribute("company", new Company());
		}
		return "index";
	}

	@PostMapping("/register")
	public String registration(@Valid @ModelAttribute("company") Company company, BindingResult result,
			RedirectAttributes redirectAttributes, Model model, HttpSession session) {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.company", result);
			redirectAttributes.addFlashAttribute("company", company);
			return "redirect:/";
		}
		String otp = functions.Otpgenrator();
		model.addAttribute("showOtpModal", true);

		// send email
		functions.sendOtpEmail(company.getEmail(), otp, company.getCompanyName());
		session.setAttribute("otp", otp);
		session.setAttribute("otpExpiry", expiryTime);
		session.setAttribute("company", company);
		model.addAttribute("company", company);

		return "index";
	}

	@PostMapping("/verifyOtp")
	public String verifyOtp(@RequestParam String otp1, @RequestParam String otp2, @RequestParam String otp3,
			@RequestParam String otp4, @RequestParam String otp5, @RequestParam String otp6, HttpSession session,
			Model model) {
		String sessionOtp = (String) session.getAttribute("otp");
		Long expiryTime = (Long) session.getAttribute("otpExpiry");
		Company company = (Company) session.getAttribute("company");

		String OTP = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;

		if (sessionOtp == null || expiryTime == null) {
			model.addAttribute("showOtpModal", true);
			model.addAttribute("company", new Company());
			model.addAttribute("error", "OTP Expire Please request New OTP");
			return "index";
		}

		if (System.currentTimeMillis() > expiryTime) {
			model.addAttribute("showOtpModal", true);
			model.addAttribute("company", new Company());
			model.addAttribute("error", "OTP Expire Please request New OTP");
			return "index";
		}

		// Check OTP match
		if (!OTP.equals(sessionOtp)) {
			model.addAttribute("showOtpModal", true);
			model.addAttribute("company", new Company());
			model.addAttribute("error", "Wrong Otp Please try Again");
			return "index";
		}
		// DB ACTION REQUIRED
		companySerrvice.registration(company);
		functions.confirmationEmail(company.getEmail(), company.getCompanyName());

		return "success";
	}

	@GetMapping("/success")
	public String successPage() {
		return "success";
	}
}
