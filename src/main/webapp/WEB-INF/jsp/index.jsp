<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>eSecure - Professional OTP Delivery Service</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root {
	--primary: #4361ee;
	--primary-dark: #3a56d4;
	--secondary: #7209b7;
	--accent: #f72585;
	--light: #f8f9fa;
	--dark: #212529;
	--success: #4cc9f0;
	--gradient: linear-gradient(135deg, var(--primary), var(--secondary));
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background-color: #f0f2f5;
	color: var(--dark);
	line-height: 1.6;
	overflow-x: hidden;
}

/* Header Styles */
header {
	background: rgba(255, 255, 255, 0.95);
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
	position: fixed;
	width: 100%;
	top: 0;
	z-index: 1000;
	transition: all 0.3s ease;
}

.header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 0;
}

.logo {
	display: flex;
	align-items: center;
	font-size: 1.8rem;
	font-weight: 700;
	color: var(--primary);
}

.logo i {
	margin-right: 10px;
	color: var(--secondary);
}

nav ul {
	display: flex;
	list-style: none;
}

nav ul li {
	margin-left: 30px;
}

nav ul li a {
	text-decoration: none;
	color: var(--dark);
	font-weight: 500;
	transition: color 0.3s;
	position: relative;
}

nav ul li a:hover {
	color: var(--primary);
}

nav ul li a::after {
	content: '';
	position: absolute;
	width: 0;
	height: 2px;
	bottom: -5px;
	left: 0;
	background: var(--gradient);
	transition: width 0.3s;
}

nav ul li a:hover::after {
	width: 100%;
}

.auth-buttons {
	display: flex;
	gap: 15px;
}

.btn {
	padding: 10px 20px;
	border-radius: 30px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	border: none;
	text-decoration: none;
	display: inline-block;
	text-align: center;
}

.btn-outline {
	background: transparent;
	border: 2px solid var(--primary);
	color: var(--primary);
}

.btn-outline:hover {
	background: var(--primary);
	color: white;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
}

.btn-primary {
	background: var(--gradient);
	color: white;
}

.btn-primary:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(67, 97, 238, 0.4);
}

/* Hero Section */
.hero {
	padding: 180px 0 100px;
	background: linear-gradient(135deg, #f5f7ff 0%, #e3e9ff 100%);
	position: relative;
	overflow: hidden;
}

.hero::before {
	content: '';
	position: absolute;
	width: 500px;
	height: 500px;
	border-radius: 50%;
	background: linear-gradient(135deg, rgba(67, 97, 238, 0.1) 0%,
		rgba(114, 9, 183, 0.1) 100%);
	top: -250px;
	right: -150px;
}

.hero::after {
	content: '';
	position: absolute;
	width: 300px;
	height: 300px;
	border-radius: 50%;
	background: linear-gradient(135deg, rgba(247, 37, 133, 0.1) 0%,
		rgba(76, 201, 240, 0.1) 100%);
	bottom: -150px;
	left: -100px;
}

.hero-content {
	display: flex;
	align-items: center;
	justify-content: space-between;
	position: relative;
	z-index: 1;
}

.hero-text {
	flex: 1;
	max-width: 600px;
}

.hero-text h1 {
	font-size: 3.5rem;
	margin-bottom: 20px;
	background: var(--gradient);
	-webkit-background-clip: text;
	background-clip: text;
	color: transparent;
	line-height: 1.2;
}

.hero-text p {
	font-size: 1.2rem;
	margin-bottom: 30px;
	color: #555;
}

.hero-image {
	flex: 1;
	text-align: center;
}

.hero-image img {
	max-width: 100%;
}

/* Features Section */
.features {
	padding: 100px 0;
	background: white;
}

.section-title {
	text-align: center;
	margin-bottom: 60px;
}

.section-title h2 {
	font-size: 2.5rem;
	color: var(--dark);
	margin-bottom: 15px;
}

.section-title p {
	color: #666;
	max-width: 700px;
	margin: 0 auto;
}

.features-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 30px;
}

.feature-card {
	background: white;
	border-radius: 15px;
	padding: 30px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
	transition: transform 0.3s, box-shadow 0.3s;
	text-align: center;
}

.feature-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.feature-icon {
	width: 80px;
	height: 80px;
	background: var(--gradient);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 20px;
	color: white;
	font-size: 2rem;
}

.feature-card h3 {
	margin-bottom: 15px;
	color: var(--dark);
}

.feature-card p {
	color: #666;
}

/* How It Works Section */
.how-it-works {
	padding: 100px 0;
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
}

.steps {
	display: flex;
	justify-content: space-between;
	position: relative;
	margin-top: 50px;
}

.steps::before {
	content: '';
	position: absolute;
	top: 40px;
	left: 10%;
	right: 10%;
	height: 3px;
	background: var(--gradient);
	z-index: 1;
}

.step {
	text-align: center;
	position: relative;
	z-index: 2;
	flex: 1;
	max-width: 250px;
}

.step-number {
	width: 80px;
	height: 80px;
	background: white;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 20px;
	font-size: 1.8rem;
	font-weight: 700;
	color: var(--primary);
	border: 3px solid var(--primary);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.step h3 {
	margin-bottom: 10px;
	color: var(--dark);
}

.step p {
	color: #666;
}

/* Pricing Section */
.pricing {
	padding: 100px 0;
	background: white;
}

.pricing-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 30px;
	margin-top: 50px;
}

.pricing-card {
	background: white;
	border-radius: 15px;
	padding: 40px 30px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease;
	text-align: center;
	position: relative;
	overflow: hidden;
}

.pricing-card.popular {
	transform: scale(1.05);
	border: 3px solid var(--primary);
	z-index: 1;
}

.pricing-card.popular::before {
	content: 'MOST POPULAR';
	position: absolute;
	top: 20px;
	right: -35px;
	background: var(--primary);
	color: white;
	padding: 5px 40px;
	font-size: 12px;
	font-weight: 600;
	transform: rotate(45deg);
}

.pricing-card h3 {
	font-size: 1.5rem;
	margin-bottom: 15px;
	color: var(--dark);
}

.price {
	font-size: 3rem;
	font-weight: 700;
	margin: 20px 0;
	color: var(--primary);
}

.price span {
	font-size: 1rem;
	color: #666;
}

.pricing-features {
	list-style: none;
	margin: 30px 0;
	text-align: left;
}

.pricing-features li {
	padding: 10px 0;
	border-bottom: 1px solid #eee;
	display: flex;
	align-items: center;
}

.pricing-features li:last-child {
	border-bottom: none;
}

.pricing-features li i {
	margin-right: 10px;
	color: var(--success);
}

.pricing-features li.disabled {
	color: #999;
}

.pricing-features li.disabled i {
	color: #ccc;
}

/* Contact Section */
.contact {
	padding: 100px 0;
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
}

.contact-container {
	display: flex;
	gap: 50px;
	margin-top: 50px;
}

.contact-info {
	flex: 1;
}

.contact-info h3 {
	margin-bottom: 30px;
	color: var(--dark);
}

.contact-method {
	display: flex;
	align-items: flex-start;
	margin-bottom: 30px;
}

.contact-icon {
	width: 60px;
	height: 60px;
	background: var(--gradient);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 1.5rem;
	margin-right: 20px;
	flex-shrink: 0;
}

.contact-details h4 {
	margin-bottom: 5px;
	color: var(--dark);
}

.contact-details p {
	color: #666;
}

.contact-form {
	flex: 1;
	background: white;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
}

.contact-form h3 {
	margin-bottom: 30px;
	color: var(--dark);
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	font-weight: 500;
	color: #555;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 1rem;
	transition: border 0.3s;
}

.form-group input:focus, .form-group textarea:focus {
	border-color: var(--primary);
	outline: none;
	box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
}

.form-group textarea {
	min-height: 150px;
	resize: vertical;
}

/* Registration Section */
.registration {
	padding: 100px 0;
	background: white;
}

.registration-container {
	display: flex;
	align-items: center;
	gap: 50px;
}

.registration-form {
	flex: 1;
	background: white;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.registration-form h2 {
	margin-bottom: 30px;
	color: var(--dark);
	text-align: center;
}

.registration-info {
	flex: 1;
}

.registration-info h2 {
	margin-bottom: 20px;
	color: var(--dark);
}

.registration-info ul {
	list-style: none;
}

.registration-info ul li {
	margin-bottom: 15px;
	display: flex;
	align-items: flex-start;
}

.registration-info ul li i {
	color: var(--success);
	margin-right: 10px;
	margin-top: 5px;
}

/* API Section */
.api-section {
	padding: 100px 0;
	background: linear-gradient(135deg, #4361ee 0%, #7209b7 100%);
	color: white;
}

.api-container {
	display: flex;
	align-items: center;
	gap: 50px;
}

.api-info {
	flex: 1;
}

.api-info h2 {
	margin-bottom: 20px;
	font-size: 2.5rem;
}

.api-info p {
	margin-bottom: 30px;
	font-size: 1.1rem;
	opacity: 0.9;
}

.api-code {
	flex: 1;
	background: rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	padding: 30px;
	font-family: monospace;
	overflow-x: auto;
}

.api-code pre {
	white-space: pre-wrap;
	line-height: 1.5;
}

/* CTA Section */
.cta {
	padding: 100px 0;
	background: var(--gradient);
	color: white;
	text-align: center;
}

.cta h2 {
	font-size: 2.5rem;
	margin-bottom: 20px;
}

.cta p {
	font-size: 1.2rem;
	max-width: 700px;
	margin: 0 auto 30px;
	opacity: 0.9;
}

/* Footer */
footer {
	background: var(--dark);
	color: white;
	padding: 70px 0 30px;
}

.footer-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 40px;
	margin-bottom: 50px;
}

.footer-col h3 {
	margin-bottom: 20px;
	font-size: 1.2rem;
	position: relative;
	padding-bottom: 10px;
}

.footer-col h3::after {
	content: '';
	position: absolute;
	left: 0;
	bottom: 0;
	width: 40px;
	height: 2px;
	background: var(--primary);
}

.footer-col ul {
	list-style: none;
}

.footer-col ul li {
	margin-bottom: 10px;
}

.footer-col ul li a {
	color: #bbb;
	text-decoration: none;
	transition: color 0.3s;
}

.footer-col ul li a:hover {
	color: white;
}

.social-icons {
	display: flex;
	gap: 15px;
	margin-top: 20px;
}

.social-icons a {
	width: 40px;
	height: 40px;
	background: rgba(255, 255, 255, 0.1);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	transition: all 0.3s;
}

.social-icons a:hover {
	background: var(--primary);
	transform: translateY(-3px);
}

.footer-bottom {
	text-align: center;
	padding-top: 30px;
	border-top: 1px solid #444;
	color: #bbb;
	font-size: 0.9rem;
}

/* Container */
.container {
	width: 90%;
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 20px;
}

.text-danger {
	color: red;
	font-size: 0.9em;
}

/* ========== BEAUTIFUL MODAL STYLES ========== */

/* Modal Backdrop */
.modal-backdrop {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.7);
	backdrop-filter: blur(10px);
	z-index: 9998;
	display: none;
	opacity: 0;
	transition: opacity 0.4s ease;
}

.modal-backdrop.active {
	display: block;
	opacity: 1;
}

/* Modal Content */
.modal-content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(0.8);
	background: white;
	border-radius: 20px;
	padding: 0;
	box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
	z-index: 9999;
	width: 90%;
	max-width: 420px;
	max-height: 90vh;
	overflow: hidden;
	opacity: 0;
	transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.modal-content.active {
	opacity: 1;
	transform: translate(-50%, -50%) scale(1);
}

/* Modal Header */
.modal-header {
	background: var(--gradient);
	color: white;
	padding: 30px;
	text-align: center;
	position: relative;
	overflow: hidden;
}

.modal-header::before {
	content: '';
	position: absolute;
	top: -50%;
	left: -50%;
	width: 200%;
	height: 200%;
	background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
	transform: rotate(45deg);
	animation: shine 3s infinite;
}

@keyframes shine {
	0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
	100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
}

.modal-header h3 {
	margin: 0;
	font-size: 1.8rem;
	font-weight: 700;
	position: relative;
	z-index: 1;
}

.modal-icon {
	font-size: 3rem;
	margin-bottom: 15px;
	display: block;
	animation: bounce 2s infinite;
}

@keyframes bounce {
	0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
	40% { transform: translateY(-10px); }
	60% { transform: translateY(-5px); }
}

.close-btn {
	position: absolute;
	top: 20px;
	right: 20px;
	background: rgba(255, 255, 255, 0.2);
	border: none;
	width: 35px;
	height: 35px;
	border-radius: 50%;
	color: white;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: all 0.3s ease;
	z-index: 2;
}

.close-btn:hover {
	background: rgba(255, 255, 255, 0.3);
	transform: rotate(90deg) scale(1.1);
}

/* Modal Body */
.modal-body {
	padding: 40px 30px 30px;
}

/* OTP Specific Styles */
.otp-input-container {
	display: flex;
	justify-content: space-between;
	gap: 10px;
	margin-bottom: 25px;
}

.otp-input {
	width: 50px;
	height: 60px;
	text-align: center;
	font-size: 1.5rem;
	font-weight: bold;
	border: 2px solid #e1e5ee;
	border-radius: 12px;
	background: #f8f9fa;
	transition: all 0.3s ease;
	outline: none;
}

.otp-input:focus {
	border-color: var(--primary);
	background: white;
	box-shadow: 0 5px 15px rgba(67, 97, 238, 0.2);
	transform: translateY(-2px);
}

.otp-input.filled {
	border-color: #4cc9f0;
	background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
}

.otp-input.error {
	border-color: #e63946;
	background: #ffe6e6;
	animation: shake 0.5s ease-in-out;
}

@keyframes shake {
	0%, 100% { transform: translateX(0); }
	25% { transform: translateX(-5px); }
	75% { transform: translateX(5px); }
}

.otp-timer {
	text-align: center;
	margin-bottom: 20px;
	font-size: 0.9rem;
	color: #666;
}

.timer-count {
	font-weight: bold;
	color: var(--primary);
	font-size: 1.1rem;
}

.verify-btn {
	width: 100%;
	padding: 16px;
	background: var(--gradient);
	color: white;
	border: none;
	border-radius: 12px;
	font-size: 1.1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	overflow: hidden;
}

.verify-btn:hover:not(:disabled) {
	transform: translateY(-3px);
	box-shadow: 0 10px 25px rgba(67, 97, 238, 0.4);
}

.verify-btn:disabled {
	background: #ccc;
	cursor: not-allowed;
	transform: none;
	box-shadow: none;
}

.resend-section {
	text-align: center;
	padding-top: 20px;
	border-top: 1px solid #eee;
	margin-top: 20px;
}

.resend-btn {
	background: transparent;
	border: 2px solid var(--primary);
	color: var(--primary);
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	font-weight: 600;
	transition: all 0.3s ease;
}

.resend-btn:hover:not(:disabled) {
	background: var(--primary);
	color: white;
	transform: translateY(-2px);
}

/* Error Message Styles */
.error-message {
	color: #e63946;
	background: #ffe6e6;
	padding: 12px;
	border-radius: 8px;
	margin: 15px 0;
	text-align: center;
	font-size: 0.9rem;
	border: 1px solid #ffcccc;
	animation: fadeIn 0.3s ease;
	display: none;
}

@keyframes fadeIn {
	from { opacity: 0; transform: translateY(-10px); }
	to { opacity: 1; transform: translateY(0); }
}

/* Responsive Design */
@media ( max-width : 992px) {
	.hero-content {
		flex-direction: column;
		text-align: center;
	}
	.hero-text {
		margin-bottom: 50px;
	}
	.registration-container, .api-container, .contact-container {
		flex-direction: column;
	}
	.steps {
		flex-direction: column;
		align-items: center;
	}
	.steps::before {
		display: none;
	}
	.step {
		margin-bottom: 40px;
	}
	.pricing-card.popular {
		transform: scale(1);
	}
	nav ul {
		display: none;
	}
}

@media ( max-width : 768px) {
	.hero-text h1 {
		font-size: 2.5rem;
	}
	.pricing-grid {
		grid-template-columns: 1fr;
	}
	.otp-input-container {
		gap: 5px;
	}
	.otp-input {
		width: 45px;
		height: 55px;
		font-size: 1.3rem;
	}
	.header-container {
		flex-wrap: wrap;
	}
	.auth-buttons {
		margin-top: 15px;
		width: 100%;
		justify-content: center;
	}
}

@media ( max-width : 480px) {
	.hero {
		padding: 150px 0 80px;
	}
	.hero-text h1 {
		font-size: 2rem;
	}
	.section-title h2 {
		font-size: 2rem;
	}
	.modal-content {
		width: 95%;
		margin: 0 auto;
	}
	.modal-body {
		padding: 30px 20px 20px;
	}
	.otp-input {
		width: 40px;
		height: 50px;
		font-size: 1.2rem;
	}
	.feature-card, .pricing-card {
		padding: 20px;
	}
}
</style>
</head>
<body>
	<!-- Header -->
	<header>
		<div class="container header-container">
			<div class="logo">
				<i class="fas fa-shield-alt"></i> <span>eSecure</span>
			</div>
			<nav>
				<ul>
					<li><a href="#home">Home</a></li>
					<li><a href="#features">Features</a></li>
					<li><a href="#how-it-works">How It Works</a></li>
					<li><a href="#pricing">Pricing</a></li>
					<li><a href="#api">API</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</nav>
			<div class="auth-buttons">
			<a href="/login" class="btn btn-primary">Login</a>
				<a href="#registration" class="btn btn-primary">Get Started</a>
			</div>
		</div>
	</header>

	<!-- Hero Section -->
	<section class="hero" id="home">
		<div class="container hero-content">
			<div class="hero-text">
				<h1>Secure OTP Delivery for Your Business</h1>
				<p>Integrate reliable, scalable OTP services into your
					applications with our powerful API. Enhance security and user
					experience with seamless authentication.</p>
				<div class="hero-buttons">
					<a href="#registration" class="btn btn-primary">Start Free
						Trial</a> <a href="#api" class="btn btn-outline">View
						Documentation</a>
				</div>
			</div>
			<div class="hero-image">
				<img src="https://cdn-icons-png.flaticon.com/512/3062/3062634.png"
					alt="OTP Security Illustration">
			</div>
		</div>
	</section>

	<!-- Features Section -->
	<section class="features" id="features">
		<div class="container">
			<div class="section-title">
				<h2>Why Choose eSecure?</h2>
				<p>Our platform offers everything you need to implement secure
					OTP authentication</p>
			</div>
			<div class="features-grid">
				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-bolt"></i>
					</div>
					<h3>Lightning Fast Delivery</h3>
					<p>OTP codes delivered in milliseconds with 99.9% uptime
						guarantee.</p>
				</div>
				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-shield-alt"></i>
					</div>
					<h3>Military-Grade Security</h3>
					<p>End-to-end encryption and secure protocols to protect your
						users.</p>
				</div>
				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-chart-line"></i>
					</div>
					<h3>Scalable Infrastructure</h3>
					<p>Handle from 10 to 10 million OTP requests without breaking a
						sweat.</p>
				</div>
				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-cogs"></i>
					</div>
					<h3>Easy Integration</h3>
					<p>Simple API with comprehensive documentation and SDKs.</p>
				</div>
				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-globe"></i>
					</div>
					<h3>Global Reach</h3>
					<p>Deliver OTPs to users anywhere in the world with localized
						delivery.</p>
				</div>
				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-headset"></i>
					</div>
					<h3>24/7 Support</h3>
					<p>Our expert team is always available to help you with
						integration.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- How It Works Section -->
	<section class="how-it-works" id="how-it-works">
		<div class="container">
			<div class="section-title">
				<h2>How It Works</h2>
				<p>Integrate our OTP service in just a few simple steps</p>
			</div>
			<div class="steps">
				<div class="step">
					<div class="step-number">1</div>
					<h3>Register Your Business</h3>
					<p>Create an account and provide your company details</p>
				</div>
				<div class="step">
					<div class="step-number">2</div>
					<h3>Get API Credentials</h3>
					<p>Receive your unique API endpoint and authentication keys</p>
				</div>
				<div class="step">
					<div class="step-number">3</div>
					<h3>Integrate Our API</h3>
					<p>Implement our API into your application backend</p>
				</div>
				<div class="step">
					<div class="step-number">4</div>
					<h3>Start Sending OTPs</h3>
					<p>Call our API whenever you need to authenticate users</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Pricing Section -->
	<section class="pricing" id="pricing">
		<div class="container">
			<div class="section-title">
				<h2>Simple, Transparent Pricing</h2>
				<p>Choose the plan that fits your business needs</p>
			</div>
			<div class="pricing-grid">
				<div class="pricing-card">
					<h3>Starter</h3>
					<div class="price">
						$19<span>/month</span>
					</div>
					<p>Perfect for small businesses and startups</p>
					<ul class="pricing-features">
						<li><i class="fas fa-check"></i> 1,000 OTPs per month</li>
						<li><i class="fas fa-check"></i> Email support</li>
						<li><i class="fas fa-check"></i> Basic analytics</li>
						<li class="disabled"><i class="fas fa-times"></i> Priority
							delivery</li>
						<li class="disabled"><i class="fas fa-times"></i> Custom
							branding</li>
					</ul>
					<a href="#registration" class="btn btn-primary">Get Started</a>
				</div>
				<div class="pricing-card popular">
					<h3>Business</h3>
					<div class="price">
						$49<span>/month</span>
					</div>
					<p>Ideal for growing businesses</p>
					<ul class="pricing-features">
						<li><i class="fas fa-check"></i> 5,000 OTPs per month</li>
						<li><i class="fas fa-check"></i> Priority support</li>
						<li><i class="fas fa-check"></i> Advanced analytics</li>
						<li><i class="fas fa-check"></i> Priority delivery</li>
						<li class="disabled"><i class="fas fa-times"></i> Custom
							branding</li>
					</ul>
					<a href="#registration" class="btn btn-primary">Get Started</a>
				</div>
				<div class="pricing-card">
					<h3>Enterprise</h3>
					<div class="price">
						$99<span>/month</span>
					</div>
					<p>For large organizations with high volume</p>
					<ul class="pricing-features">
						<li><i class="fas fa-check"></i> 15,000 OTPs per month</li>
						<li><i class="fas fa-check"></i> 24/7 dedicated support</li>
						<li><i class="fas fa-check"></i> Full analytics dashboard</li>
						<li><i class="fas fa-check"></i> Highest priority delivery</li>
						<li><i class="fas fa-check"></i> Custom branding</li>
					</ul>
					<a href="#contact" class="btn btn-primary">Contact Sales</a>
				</div>
			</div>
			<div class="text-center mt-5">
				<p>
					Need a custom plan? <a href="#contact">Contact us</a> for
					enterprise solutions with volume discounts.
				</p>
			</div>
		</div>
	</section>

	<!-- Registration Section -->
<section class="registration" id="registration">
    <div class="container registration-container">
        <div class="registration-form">
            <h2>Register Your Business</h2>
            
            <!-- Display registration errors if any -->
            <c:if test="${not empty registrationError}">
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i> ${registrationError}
                </div>
            </c:if>
            
            <form:form modelAttribute="company"
                action="${pageContext.request.contextPath}/register" method="post"
                id="business-registration">

                <div class="form-group">
                    <label for="company-name">Company Name</label>
                    <form:input path="companyName" id="company-name"
                        cssClass="form-control" />
                    <form:errors path="companyName" class="text-danger" />
                </div>

                <div class="form-group">
                    <label for="email">Business Email</label>
                    <form:input path="email" id="email" cssClass="form-control" />
                    <form:errors path="email" class="text-danger" />
                </div>

                <div class="form-group">
                    <label for="phone">Contact Number</label>
                    <form:input path="phone" id="phone" cssClass="form-control" />
                    <form:errors path="phone" class="text-danger" />
                </div>

                <div class="form-group">
                    <label for="person">Contact Person</label>
                    <form:input path="contactPerson" id="person"
                        cssClass="form-control" />
                    <form:errors path="contactPerson" class="text-danger" />
                </div>

                <div class="form-group">
                    <label for="website">Company Website</label>
                    <form:input path="website" id="website" cssClass="form-control" />
                    <form:errors path="website" class="text-danger" />
                </div>

                <div class="form-group">
                    <label for="password">Create Password</label>
                    <form:password path="password" id="password"
                        cssClass="form-control" />
                    <form:errors path="password" class="text-danger" />
                </div>

                <button type="submit" class="btn btn-primary" style="width: 100%;">
                    Register Now
                </button>

            </form:form>
        </div>
        <div class="registration-info">
            <h2>What Happens After Registration?</h2>
            <ul>
                <li><i class="fas fa-check-circle"></i>
                    <div>You'll receive a confirmation email with your account
                        details</div></li>
                <li><i class="fas fa-check-circle"></i>
                    <div>Our team will verify your business details (usually
                        within 24 hours)</div></li>
                <li><i class="fas fa-check-circle"></i>
                    <div>You'll get access to our developer dashboard with API
                        documentation</div></li>
                <li><i class="fas fa-check-circle"></i>
                    <div>We'll provide you with unique API credentials for
                        integration</div></li>
                <li><i class="fas fa-check-circle"></i>
                    <div>Start with 100 free OTPs to test the service</div></li>
                <li><i class="fas fa-check-circle"></i>
                    <div>Our support team will contact you to assist with
                        integration</div></li>
            </ul>
        </div>
    </div>
</section>

	<!-- Contact Section -->
	<section class="contact" id="contact">
		<div class="container">
			<div class="section-title">
				<h2>Contact Us</h2>
				<p>Have questions? Our team is here to help you get started</p>
			</div>
			<div class="contact-container">
				<div class="contact-info">
					<h3>Get in Touch</h3>
					<div class="contact-method">
						<div class="contact-icon">
							<i class="fas fa-map-marker-alt"></i>
						</div>
						<div class="contact-details">
							<h4>Our Office</h4>
							<p>
								123 Business Avenue, Suite 100<br>San Francisco, CA 94107
							</p>
						</div>
					</div>
					<div class="contact-method">
						<div class="contact-icon">
							<i class="fas fa-phone"></i>
						</div>
						<div class="contact-details">
							<h4>Phone</h4>
							<p>
								+1 (555) 123-4567<br>Mon-Fri from 8am to 6pm
							</p>
						</div>
					</div>
					<div class="contact-method">
						<div class="contact-icon">
							<i class="fas fa-envelope"></i>
						</div>
						<div class="contact-details">
							<h4>Email</h4>
							<p>
								support@eSecure.com<br>We reply within 24 hours
							</p>
						</div>
					</div>
					<div class="social-icons">
						<a href="#"><i class="fab fa-twitter"></i></a> <a href="#"><i
							class="fab fa-linkedin-in"></i></a> <a href="#"><i
							class="fab fa-github"></i></a> <a href="#"><i
							class="fab fa-facebook-f"></i></a>
					</div>
				</div>
				<div class="contact-form">
					<h3>Send us a Message</h3>
					<form id="contact-form" action="${pageContext.request.contextPath}/contact" method="post">
						<div class="form-group">
							<label for="name">Your Name</label> <input type="text" id="name"
								name="name" required>
						</div>
						<div class="form-group">
							<label for="contact-email">Email Address</label> <input
								type="email" id="contact-email" name="email" required>
						</div>
						<div class="form-group">
							<label for="subject">Subject</label> <input type="text"
								id="subject" name="subject" required>
						</div>
						<div class="form-group">
							<label for="message">Message</label>
							<textarea id="message" name="message" required></textarea>
						</div>
						<button type="submit" class="btn btn-primary" style="width: 100%;">Send
							Message</button>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- API Section  -->
	<section class="api-section" id="api">
		<div class="container api-container">
			<div class="api-info">
				<h2>Simple API Integration</h2>
				<p>Our REST API is designed for easy integration with your
					existing systems. Send OTPs with a simple HTTP request and verify
					them securely.</p>
				<p>All API communication is encrypted with TLS 1.3, and we
					provide SDKs for popular programming languages.</p>
				<a href="#" class="btn btn-outline"
					style="background: rgba(255, 255, 255, 0.1); color: white; border-color: white;">View
					Full Documentation</a>
			</div>
			<div class="api-code">
				<pre>
					<code>// Example: Sending an OTP
POST https://api.eSecure.com/v1/otp/send
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "recipient": "user@example.com",
  "message": "Your verification code is: {code}",
  "length": 6,
  "expiry": 300
}

// Response
{
  "success": true,
  "otp_id": "otp_abc123def456",
  "expires_at": "2023-07-15T10:30:00Z"
}</code>
				</pre>
			</div>
		</div>
	</section>

	<!-- CTA Section -->
	<section class="cta">
		<div class="container">
			<h2>Ready to Secure Your Application?</h2>
			<p>Join thousands of businesses that trust our OTP service for
				their authentication needs</p>
			<a href="#registration" class="btn btn-outline"
				style="background: white; color: var(--primary);">Start Your
				Free Trial</a>
		</div>
	</section>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="footer-container">
				<div class="footer-col">
					<h3>eSecure</h3>
					<p>Providing reliable OTP delivery services to businesses
						worldwide since 2020.</p>
					<div class="social-icons">
						<a href="#"><i class="fab fa-twitter"></i></a> <a href="#"><i
							class="fab fa-linkedin-in"></i></a> <a href="#"><i
							class="fab fa-github"></i></a> <a href="#"><i
							class="fab fa-facebook-f"></i></a>
					</div>
				</div>
				<div class="footer-col">
					<h3>Quick Links</h3>
					<ul>
						<li><a href="#home">Home</a></li>
						<li><a href="#features">Features</a></li>
						<li><a href="#how-it-works">How It Works</a></li>
						<li><a href="#pricing">Pricing</a></li>
					</ul>
				</div>
				<div class="footer-col">
					<h3>Resources</h3>
					<ul>
						<li><a href="#">Documentation</a></li>
						<li><a href="#">API Reference</a></li>
						<li><a href="#">SDK Downloads</a></li>
						<li><a href="#">Blog</a></li>
					</ul>
				</div>
				<div class="footer-col">
					<h3>Contact Us</h3>
					<ul>
						<li><i class="fas fa-envelope"></i> support@eSecure.com</li>
						<li><i class="fas fa-phone"></i> +1 (555) 123-4567</li>
						<li><i class="fas fa-map-marker-alt"></i> 123 Business Ave,
							Suite 100<br>San Francisco, CA 94107</li>
					</ul>
				</div>
			</div>
			<div class="footer-bottom">
				<p>
					&copy; 2023 eSecure. All rights reserved. | <a href="#"
						style="color: #bbb;">Privacy Policy</a> | <a href="#"
						style="color: #bbb;">Terms of Service</a>
				</p>
			</div>
		</div>
	</footer>

	<!-- OTP Modal -->
	<div id="otpModalBackdrop" class="modal-backdrop"></div>
	<div id="otpModal" class="modal-content">
		<div class="modal-header">
			<i class="fas fa-shield-alt modal-icon"></i>
			<h3>Verify Your Identity</h3>
			<button type="button" class="close-btn" onclick="hideOtpModal()">
				<i class="fas fa-times"></i>
			</button>
		</div>
		<div class="modal-body">
			<div style="text-align: center; margin-bottom: 25px; color: #666;">
				<p>We've sent a 6-digit verification code to your email</p>
				<strong style="color: var(--primary);">${userEmail}</strong>
				
				<!-- Display OTP errors if any -->
				<c:if test="${not empty otpError}">
					<div class="error-message">
						<i class="fas fa-exclamation-circle"></i> ${otpError}
					</div>
				</c:if>
			</div>
			
			<form id="otpForm" action="${pageContext.request.contextPath}/verifyOtp" method="post">
				<div class="otp-input-container">
					<input type="text" class="otp-input ${not empty otpError ? 'error' : ''}" 
					       maxlength="1" pattern="[0-9]" inputmode="numeric" name="otp1" required>
					<input type="text" class="otp-input ${not empty otpError ? 'error' : ''}" 
					       maxlength="1" pattern="[0-9]" inputmode="numeric" name="otp2" required>
					<input type="text" class="otp-input ${not empty otpError ? 'error' : ''}" 
					       maxlength="1" pattern="[0-9]" inputmode="numeric" name="otp3" required>
					<input type="text" class="otp-input ${not empty otpError ? 'error' : ''}" 
					       maxlength="1" pattern="[0-9]" inputmode="numeric" name="otp4" required>
					<input type="text" class="otp-input ${not empty otpError ? 'error' : ''}" 
					       maxlength="1" pattern="[0-9]" inputmode="numeric" name="otp5" required>
					<input type="text" class="otp-input ${not empty otpError ? 'error' : ''}" 
					       maxlength="1" pattern="[0-9]" inputmode="numeric" name="otp6" required>
				</div>
				
				<button type="submit" class="verify-btn" id="verifyOtpBtn">
					Verify & Continue
				</button>
			</form>
			
			<div class="resend-section">
				<p style="color: #666; margin-bottom: 10px;">Didn't receive the code?</p>
				<button type="button" class="resend-btn" onclick="resendOTP()">
					Resend Code
				</button>
			</div>
		</div>
	</div>

	<script>
    // Simple Modal Functions - Only open/close
    const otpModal = document.getElementById("otpModal");
    const otpModalBackdrop = document.getElementById("otpModalBackdrop");
    const otpInputs = document.querySelectorAll('.otp-input');
    let timerInterval;
    let timeLeft = 300;

    function showOtpModal() {
        resetOtpForm();
        startTimer();
        
        otpModal.classList.add("active");
        otpModalBackdrop.classList.add("active");
        document.body.style.overflow = "hidden";
        
        // Auto focus first OTP input
        setTimeout(() => {
            if (otpInputs[0]) otpInputs[0].focus();
        }, 400);
    }

    function hideOtpModal() {
        otpModal.classList.remove("active");
        otpModalBackdrop.classList.remove("active");
        document.body.style.overflow = "auto";
        clearInterval(timerInterval);
    }

    function resetOtpForm() {
        otpInputs.forEach(input => {
            input.value = '';
            input.classList.remove('filled', 'error');
        });
        timeLeft = 300;
        updateTimerDisplay();
    }

    function startTimer() {
        clearInterval(timerInterval);
        timeLeft = 300;
        updateTimerDisplay();
        
        timerInterval = setInterval(() => {
            timeLeft--;
            updateTimerDisplay();
            
            if (timeLeft <= 0) {
                clearInterval(timerInterval);
                // Timer finish par kuch special effect ya message
                document.getElementById('otpTimer').style.color = '#e63946';
            }
        }, 1000);
    }

    function updateTimerDisplay() {
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        const timerElement = document.getElementById('otpTimer');
        
        if (timerElement) {
            timerElement.textContent = 
                `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            
            // Change color when time is running out
            if (timeLeft <= 60) {
                timerElement.style.color = '#e63946';
            } else {
                timerElement.style.color = 'var(--primary)';
            }
        }
    }

    function resendOTP() {
        // Backend se resend OTP ka logic ayega
        alert('New OTP has been sent to your email!');
        resetOtpForm();
        startTimer();
    }

    // OTP Input handling for better UX
    otpInputs.forEach((input, index) => {
        // Input event
        input.addEventListener('input', (e) => {
            const value = e.target.value;
            
            // Only allow numbers
            if (!/^\d*$/.test(value)) {
                e.target.value = '';
                return;
            }
            
            if (value) {
                e.target.classList.add('filled');
                e.target.classList.remove('error');
                
                // Auto-focus next input
                if (index < otpInputs.length - 1) {
                    otpInputs[index + 1].focus();
                }
            } else {
                e.target.classList.remove('filled');
            }
        });
        
        // Backspace handling
        input.addEventListener('keydown', (e) => {
            if (e.key === 'Backspace' && !e.target.value && index > 0) {
                otpInputs[index - 1].focus();
            }
        });
        
        // Paste handling
        input.addEventListener('paste', (e) => {
            e.preventDefault();
            const pasteData = e.clipboardData.getData('text').slice(0, 6);
            
            pasteData.split('').forEach((char, i) => {
                if (otpInputs[i] && /^\d$/.test(char)) {
                    otpInputs[i].value = char;
                    otpInputs[i].classList.add('filled');
                    otpInputs[i].classList.remove('error');
                }
            });
            
            // Focus next empty input or last input
            const nextEmptyIndex = pasteData.length < 6 ? pasteData.length : 5;
            if (otpInputs[nextEmptyIndex]) {
                otpInputs[nextEmptyIndex].focus();
            }
        });
    });

    // ========== MODAL CLOSE EVENT HANDLERS ==========
    
    // OTP Modal - Backdrop click se CLOSE NAHI HOGA (sirf close button se hoga)
    otpModalBackdrop.addEventListener('click', function(e) {
        // Intentionally empty - OTP modal backdrop click se close nahi hoga
        // Sirf close button se hi close hoga
    });

    // Escape key handling
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            // OTP modal escape se close NAHI hoga
        }
    });

    // ========== BACKEND INTEGRATION ==========
    
    // Backend se OTP modal show karne ke liye
    const shouldShowOtpModal = "${showOtpModal}";
    if (shouldShowOtpModal === "true") {
        showOtpModal();
    }

    // Agar OTP error hai to inputs ko highlight karo
    const otpError = "${otpError}";
    if (otpError && otpError.length > 0) {
        // OTP modal show karo agar error hai
        if (!otpModal.classList.contains('active')) {
            showOtpModal();
        }
        
        // Inputs ko error style do
        setTimeout(() => {
            otpInputs.forEach(input => {
                input.classList.add('error');
            });
        }, 500);
    }

    // ========== SMOOTH SCROLLING & OTHER EFFECTS ==========
    
    // Header scroll effect
    window.addEventListener('scroll', function() {
        const header = document.querySelector('header');
        if (window.scrollY > 50) {
            header.style.background = 'rgba(255, 255, 255, 0.98)';
            header.style.boxShadow = '0 5px 20px rgba(0, 0, 0, 0.1)';
        } else {
            header.style.background = 'rgba(255, 255, 255, 0.95)';
            header.style.boxShadow = '0 2px 15px rgba(0, 0, 0, 0.1)';
        }
    });

    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Form submission enhancements (visual feedback)
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function(e) {
            const submitBtn = this.querySelector('button[type="submit"]');
            if (submitBtn) {
                // Add loading state
                submitBtn.style.opacity = '0.8';
                submitBtn.disabled = true;
                
                // Reset after 2 seconds (fallback)
                setTimeout(() => {
                    submitBtn.style.opacity = '1';
                    submitBtn.disabled = false;
                }, 2000);
            }
        });
    });

    // Mobile menu toggle (agar baad mein add karna ho)
    function toggleMobileMenu() {
        const nav = document.querySelector('nav ul');
        if (nav) {
            nav.style.display = nav.style.display === 'flex' ? 'none' : 'flex';
        }
    }

    console.log('eSecure OTP Service - Frontend Loaded Successfully');
</script>
</body>
</html>