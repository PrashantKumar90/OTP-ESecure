package com.pentagon.eSecure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pentagon.eSecure.model.Company;
import com.pentagon.eSecure.service.LoginService;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@PostMapping("/login")
	public String Login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {

		Company company = loginService.login(email, password);

		if (company != null) {

			session.setAttribute("userEmail", company.getEmail());
			session.setAttribute("companyId", company.getId());
			// PASS FULL COMPANY OBJECT with session
			
			return "redirect:/dashboard";
		}
		return "404";
	}
	 	
	@GetMapping("/login")
	public String successPage() {
		return "login";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		// 1. Invalidate Session
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		// 2. Clear Cache so back button doesn’t show dashboard again
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", 0); // Proxies

		// 3. Redirect to login page
		return "redirect:/login";
	}


}
