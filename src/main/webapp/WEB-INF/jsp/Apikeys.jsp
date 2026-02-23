<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>API Keys</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	font-family: Arial, sans-serif;
	background: #f5f6fa;
	padding: 20px;
}

.container {
	max-width: 900px;
	margin: auto;
}

h2 {
	color: #333;
	margin-bottom: 20px;
	font-size: 28px;
}

.api-card {
	background: #fff;
	border-radius: 12px;
	padding: 20px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	background: #4b7bec;
	color: #fff;
	text-align: left;
	padding: 12px;
	border-radius: 6px 6px 0 0;
}

td {
	background: #fff;
	padding: 12px;
	border-bottom: 1px solid #eee;
}

.no-data {
	padding: 20px;
	text-align: center;
	background: #fff;
	border-radius: 8px;
	font-size: 18px;
	color: #777;
}

/* Modal styles */
.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	opacity: 0;
	visibility: hidden;
	transition: all 0.3s ease;
	z-index: 2000;
}

.modal-overlay.active {
	opacity: 1;
	visibility: visible;
}

.modal {
	background: white;
	border-radius: 12px;
	width: 90%;
	max-width: 400px;
	padding: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	transform: translateY(-20px);
	transition: transform 0.3s ease;
}

.modal-overlay.active .modal {
	transform: translateY(0);
}

.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.close-btn {
	background: none;
	border: none;
	font-size: 1.5rem;
	cursor: pointer;
	color: #999;
}

.close-btn:hover {
	color: red;
}

.modal-footer {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
	margin-top: 20px;
}
</style>
</head>

<body>
	<div class="container">
		<h2>Your API Keys</h2>

		<%
		java.util.List<com.pentagon.eSecure.model.APICredential> list = (java.util.List<com.pentagon.eSecure.model.APICredential>) request
				.getAttribute("apiKeys");
		%>

		<%
		if (list == null || list.isEmpty()) {
		%>
		<div class="no-data">No API Keys Found</div>
		<%
		} else {
		%>
		<div class="api-card">
			<table>
				<tr>
					<th>API Key</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				<%
				for (com.pentagon.eSecure.model.APICredential api : list) {
				%>
				<tr>
					<td><%=api.getApiKey()%></td>
					<td><%=api.getEmail()%></td>
					<td>
						<form action="/dashboard/deactivate" method="post"
							onsubmit="return confirmDeactivation(this);">
							<input type="hidden" name="id" value="<%=api.getId()%>">
							<button type="submit" class="btn btn-danger btn-sm">
								Deactivate</button>
						</form>
					</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<%
		}
		%>

		<br>
		<center>
			<a href="/dashboard" class="btn btn-primary btn-sm">Back</a>
		</center>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function confirmDeactivation(form) {
			// Get email from data attribute or you can hardcode if needed
			const email = form.querySelector('input[name="id"]').value;
			return confirm(`Are you sure you want to deactivate the API key ? Once you deactivate this can not be Undone !!!`);
			
		}
	</script>
</body>
</html>
