
<%@ page import="com.pentagon.eSecure.model.Company"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>eSecure - Admin Dashboard</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
:root {
	--primary: #4361ee;
	--primary-dark: #3a56d4;
	--secondary: #7209b7;
	--accent: #f72585;
	--success: #4cc9f0;
	--warning: #f8961e;
	--danger: #e63946;
	--light: #f8f9fa;
	--dark: #212529;
	--sidebar-width: 250px;
	--header-height: 70px;
	--gradient: linear-gradient(135deg, var(--primary), var(--secondary));
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background-color: #f5f7fb;
	color: var(--dark);
	overflow-x: hidden;
}

/* Layout */
.dashboard-container {
	display: flex;
	min-height: 100vh;
}

/* Sidebar */
.sidebar {
	width: var(--sidebar-width);
	background: var(--gradient);
	color: white;
	position: fixed;
	height: 100vh;
	transition: all 0.3s;
	z-index: 1000;
	box-shadow: 3px 0 15px rgba(0, 0, 0, 0.1);
}

.sidebar-header {
	padding: 20px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
	display: flex;
	align-items: center;
	gap: 10px;
}

.sidebar-header h2 {
	font-size: 1.5rem;
}

.sidebar-menu {
	padding: 20px 0;
}

.menu-item {
	padding: 15px 20px;
	display: flex;
	align-items: center;
	gap: 15px;
	text-decoration: none;
	color: rgba(255, 255, 255, 0.8);
	transition: all 0.3s;
	border-left: 3px solid transparent;
}

.menu-item:hover, .menu-item.active {
	background: rgba(255, 255, 255, 0.1);
	color: white;
	border-left-color: white;
}

.menu-item i {
	width: 20px;
	text-align: center;
}

/* Main Content */
.main-content {
	flex: 1;
	margin-left: var(--sidebar-width);
	transition: all 0.3s;
}

/* Header */
.header {
	height: var(--header-height);
	background: white;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 30px;
	position: sticky;
	top: 0;
	z-index: 999;
}

.header-left h1 {
	font-size: 1.5rem;
	color: var(--dark);
}

.header-right {
	display: flex;
	align-items: center;
	gap: 20px;
}

.user-profile {
	display: flex;
	align-items: center;
	gap: 10px;
	cursor: pointer;
}

.user-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: var(--gradient);
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-weight: bold;
}

.logout-link {
	text-decoration: none;
	color: var(--dark);
	display: flex;
	align-items: center;
	gap: 8px;
	padding: 8px 15px;
	border-radius: 5px;
	transition: all 0.3s ease;
}

.logout-link:hover {
	background-color: rgba(67, 97, 238, 0.1);
	color: var(--primary);
	text-decoration: none;
}

/* Content Area */
.content {
	padding: 30px;
}

/* Stats Grid */
.stats-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
	gap: 20px;
	margin-bottom: 30px;
}

.stat-card {
	background: white;
	border-radius: 15px;
	padding: 25px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
	display: flex;
	align-items: center;
	gap: 20px;
	transition: transform 0.3s;
}

.stat-card:hover {
	transform: translateY(-5px);
}

.stat-icon {
	width: 60px;
	height: 60px;
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 1.5rem;
	color: white;
}

.stat-icon.primary {
	background: var(--primary);
}

.stat-icon.success {
	background: var(--success);
}

.stat-icon.warning {
	background: var(--warning);
}

.stat-icon.danger {
	background: var(--danger);
}

.stat-info h3 {
	font-size: 1.8rem;
	margin-bottom: 5px;
}

.stat-info p {
	color: #666;
	font-size: 0.9rem;
}

/* Charts Section */
.charts-grid {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 20px;
	margin-bottom: 30px;
}

.chart-card {
	background: white;
	border-radius: 15px;
	padding: 25px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.chart-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.chart-header h3 {
	color: var(--dark);
}

.chart-container {
	height: 300px;
	position: relative;
}

/* Recent Activity */
.activity-card {
	background: white;
	border-radius: 15px;
	padding: 25px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.activity-list {
	list-style: none;
}

.activity-item {
	display: flex;
	align-items: center;
	gap: 15px;
	padding: 15px 0;
	border-bottom: 1px solid #eee;
}

.activity-item:last-child {
	border-bottom: none;
}

.activity-icon {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 0.9rem;
}

.activity-icon.success {
	background: var(--success);
}

.activity-icon.warning {
	background: var(--warning);
}

.activity-icon.primary {
	background: var(--primary);
}

.activity-content {
	flex: 1;
}

.activity-content h4 {
	margin-bottom: 5px;
	font-size: 0.95rem;
}

.activity-content p {
	color: #666;
	font-size: 0.85rem;
}

.activity-time {
	color: #999;
	font-size: 0.8rem;
}

/* Quick Actions */
.quick-actions {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 20px;
	margin-bottom: 30px;
}

.action-card {
	background: white;
	border-radius: 15px;
	padding: 25px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
	text-align: center;
	cursor: pointer;
	transition: all 0.3s;
}

.action-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.action-icon {
	width: 60px;
	height: 60px;
	border-radius: 15px;
	background: var(--gradient);
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 1.5rem;
	margin: 0 auto 15px;
}

.action-card h3 {
	margin-bottom: 10px;
	color: var(--dark);
}

.action-card p {
	color: #666;
	font-size: 0.9rem;
}

/* Modal Styles */
.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	backdrop-filter: blur(5px);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 2000;
	opacity: 0;
	visibility: hidden;
	transition: all 0.3s ease;
}

.modal-overlay.active {
	opacity: 1;
	visibility: visible;
}

.modal {
	background: white;
	border-radius: 15px;
	width: 90%;
	max-width: 500px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	transform: translateY(-20px);
	transition: transform 0.3s ease;
}

.modal-overlay.active .modal {
	transform: translateY(0);
}

.modal-header {
	padding: 20px 25px;
	border-bottom: 1px solid #eee;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.modal-header h3 {
	color: var(--dark);
	font-size: 1.3rem;
}

.close-btn {
	background: none;
	border: none;
	font-size: 1.5rem;
	color: #999;
	cursor: pointer;
	transition: color 0.3s;
}

.close-btn:hover {
	color: var(--danger);
}

.modal-body {
	padding: 25px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	color: var(--dark);
	font-weight: 500;
}

.form-control {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 1rem;
	transition: border-color 0.3s;
}

.form-control:focus {
	outline: none;
	border-color: var(--primary);
}

.form-select {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 1rem;
	background-color: white;
	cursor: pointer;
}

.form-select:focus {
	outline: none;
	border-color: var(--primary);
}

.checkbox-group {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
}

.checkbox-group input[type="checkbox"] {
	width: 18px;
	height: 18px;
}

.checkbox-group label {
	margin-bottom: 0;
	font-weight: normal;
}

.modal-footer {
	padding: 15px 25px;
	border-top: 1px solid #eee;
	display: flex;
	justify-content: flex-end;
	gap: 15px;
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	font-size: 1rem;
	cursor: pointer;
	transition: all 0.3s;
}

.btn-primary {
	background: var(--primary);
	color: white;
}

.btn-primary:hover {
	background: var(--primary-dark);
}

.btn-secondary {
	background: #f0f0f0;
	color: var(--dark);
}

.btn-secondary:hover {
	background: #e0e0e0;
}

/* Responsive */
@media ( max-width : 992px) {
	.charts-grid {
		grid-template-columns: 1fr;
	}
	.sidebar {
		transform: translateX(-100%);
	}
	.sidebar.active {
		transform: translateX(0);
	}
	.main-content {
		margin-left: 0;
	}
}

@media ( max-width : 768px) {
	.stats-grid {
		grid-template-columns: 1fr;
	}
	.quick-actions {
		grid-template-columns: 1fr;
	}
	.modal {
		width: 95%;
	}
}
</style>
<%


%>


</head>
<body>
	<div class="dashboard-container">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="sidebar-header">
				<i class="fas fa-shield-alt"></i>
				<h2>eSecure</h2>
			</div>
			<div class="sidebar-menu">
				<a href="#" class="menu-item active"> <i class="fas fa-home"></i>
					<span>Dashboard</span>
				</a> <a href="#" class="menu-item"> <i class="fas fa-chart-bar"></i>
					<span>Reports</span>
				</a> <a href="#" class="menu-item"> <i class="fas fa-key"></i> <span>API
						Keys</span>
				</a> <a href="#" class="menu-item"> <i
					class="fas fa-file-invoice-dollar"></i> <span>Billing</span>
				</a> <a href="#" class="menu-item"> <i class="fas fa-cog"></i> <span>Settings</span>
				</a> <a href="#" class="menu-item"> <i class="fas fa-headset"></i> <span>Support</span>
				</a> <a href="/logout" class="menu-item"> <i
					class="fas fa-sign-out-alt"></i> <span>Logout</span>
				</a>
			</div>
		</div>

		<!-- Main Content -->
		<div class="main-content">
			<!-- Header -->
			<div class="header">
				<div class="header-left">
					<h1>Dear ${company.companyName}</h1>
				</div>
				<div class="header-right">
					<div class="header-right">
						<div class="notifications">
							<a href="/logout" class="logout-link"> <i
								class="fas fa-sign-out-alt"></i> <span>Logout</span>
							</a>
						</div>
					</div>

					<!-- admin name -->
					<div class="user-profile">
						<div class="user-info">
							<div class="user-name">${company.companyName}</div>

							<div class="user-role">Administrator</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Content -->
			<div class="content">
				<!-- Stats Grid -->
				<div class="stats-grid">
					<div class="stat-card">
						<div class="stat-icon primary">
							<i class="fas fa-paper-plane"></i>
						</div>
						<div class="stat-info">
							<h3>12,458</h3>
							<p>OTPs Sent Today</p>
						</div>
					</div>
					<div class="stat-card">
						<div class="stat-icon success">
							<i class="fas fa-check-circle"></i>
						</div>
						<div class="stat-info">
							<h3>11,892</h3>
							<p>Successful Deliveries</p>
						</div>
					</div>
					<div class="stat-card">
						<div class="stat-icon warning">
							<i class="fas fa-exclamation-triangle"></i>
						</div>
						<div class="stat-info">
							<h3>566</h3>
							<p>Failed Attempts</p>
						</div>
					</div>
					<div class="stat-card">
						<div class="stat-icon danger">
							<i class="fas fa-clock"></i>
						</div>
						<div class="stat-info">
							<h3>1.2s</h3>
							<p>Average Response Time</p>
						</div>
					</div>
				</div>

				<!-- Quick Actions -->
				<div class="quick-actions">
					<form action="/dashboard/API-Keys" method="post">
						<button type="submit"
							style="all: unset; cursor: pointer; width: 100%;">
							<div class="action-card">
								<div class="action-icon">
									<i class="fas fa-key"></i>
								</div>
								<h3>API Keys</h3>
								<p>Manage your API keys</p>
							</div>
						</button>
					</form>

					<div class="action-card" id="generateKeyBtn">
						<div class="action-icon">
							<i class="fas fa-plus"></i>
						</div>
						<h3>Generate API Key</h3>
						<p>Create new API credentials</p>
					</div>
					<div class="action-card">
						<div class="action-icon">
							<i class="fas fa-chart-bar"></i>
						</div>
						<h3>View Reports</h3>
						<p>Generate usage reports</p>
					</div>
					<div class="action-card">
						<div class="action-icon">
							<i class="fas fa-cog"></i>
						</div>
						<h3>Settings</h3>
						<p>Configure system settings</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal for Generate API Key -->
	<div class="modal-overlay" id="apiKeyModal">
		<div class="modal">
			<div class="modal-header">
				<h3>Generate API Key</h3>
				<button class="close-btn" id="closeModal">&times;</button>
			</div>
			<div class="modal-body">
				<form action="dashboard/generatekey" method="post" id="apiKeyForm">
					<div class="form-group">
						<label for="keyName">Email for sending Email</label> <input
							type="text" id="keyName" class="form-control"
							placeholder="Enter a email" name="email" required>
					</div>
					<div class="form-group">
						<label for="keyType">App PassKey </label> <input type="text"
							id="keyName" class="form-control" placeholder="Enter a email"
							name="passkey" required>
					</div>
					<input type="hidden" name="id" value="${company.id}">
					<div class="modal-footer">
						<button class="btn btn-secondary" id="cancelBtn">Cancel</button>
						<button class="btn btn-primary" id="generateBtn">Generate
							Key</button>
					</div>
				</form>
			</div>

		</div>
	</div>

	<script>
		// Mobile sidebar toggle (you can add a hamburger menu later)
		function toggleSidebar() {
			document.querySelector('.sidebar').classList.toggle('active');
		}

		// Modal functionality
		document.addEventListener('DOMContentLoaded', function() {
			const modal = document.getElementById('apiKeyModal');
			const generateKeyBtn = document.getElementById('generateKeyBtn');
			const closeModalBtn = document.getElementById('closeModal');
			const cancelBtn = document.getElementById('cancelBtn');
			const generateBtn = document.getElementById('generateBtn');

			// Open modal
			generateKeyBtn.addEventListener('click', function() {
				modal.classList.add('active');
			});

			// Close modal
			function closeModal() {
				modal.classList.remove('active');
			}

			closeModalBtn.addEventListener('click', closeModal);
			cancelBtn.addEventListener('click', closeModal);

			// Close modal when clicking outside
			modal.addEventListener('click', function(e) {
				if (e.target === modal) {
					closeModal();
				}
			});
		});
	</script>
</body>
</html>