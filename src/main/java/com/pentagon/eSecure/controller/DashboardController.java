package com.pentagon.eSecure.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pentagon.eSecure.model.APICredential;
import com.pentagon.eSecure.model.Company;
import com.pentagon.eSecure.service.DashboardService;
import com.pentagon.eSecure.service.LoginService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

	@Autowired
	LoginService loginService;

	@Autowired
	DashboardService dashboardService;

	@GetMapping("")
	public String Dashboard(Model model, HttpSession session, HttpServletResponse response) {

		String email = (String) session.getAttribute("userEmail");

		if (email == null) {
			System.out.println("No Session Available");
			return "redirect:/";
		}
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		// Fetch company again from DB → fresh data
		Company company = loginService.getCompanyByEmail(email);
		model.addAttribute("company", company);
		return "dashboard";
	}

	@PostMapping("/generatekey")
	public String generateKey(@RequestParam("email") String email, @RequestParam("passkey") String passkey,
			@RequestParam("id") Long companyId, Model model) {

		// find the mailId by using the company id
		APICredential saved = dashboardService.generateKey(email, passkey, companyId);
		if (saved != null) {
			dashboardService.reveretEmailForKeys(companyId);
		}
		// fallback page will be added
		// revert a mail so that they can get the status
		return "redirect:/success";
	}

	@GetMapping("/API-Keys")
	public String loadApiKeys(HttpSession session, Model model, HttpServletResponse response) {

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		Long companyId = (Long) session.getAttribute("companyId");
		if (companyId == null)
			return "redirect:/login";

		List<APICredential> list = dashboardService.getApiKeysByCompany(companyId);
		model.addAttribute("apiKeys", list);

		return "Apikeys"; // JSP name
	}

	@PostMapping("/API-Keys")
	public String yourApiKeys(HttpSession session, Model model) {
		Long companyId = (Long) session.getAttribute("companyId");
		List<APICredential> apiKeys = dashboardService.getApiKeysByCompany(companyId);
		model.addAttribute("apiKeys", apiKeys);
		return "Apikeys";
	}
	// yha se deactivate kar
	@PostMapping("/deactivate")
	public String deactivateKeys(@RequestParam Long id) { 
		dashboardService.deactivateKey(id);
		return "redirect:/dashboard/API-Keys";
	}
}
