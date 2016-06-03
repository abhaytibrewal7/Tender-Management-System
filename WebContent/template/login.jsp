<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="content-bottom">
	<div class="login-tab">
		<div class="user-login">
			<h2>Login</h2>
			<div class="strip"></div>
			<form action="VendorController" method="post">
				<input type="text" value="name@email.com" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'name@email.com';}"
					required="" name="username"> <input type="password"
					value="PASSWORD" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'PASSWORD';}"
					required="" name="password">
				<div class="user-grids">
					<div class="user-left">
						<label><input type="checkbox" name="checkbox" checked=""><i>Remember
								me?</i></label>
					</div>
					<div class="user-right">
						<input type="submit" name="loginVendor" value="LOGIN">
					</div>
					<div class="clearfix">
						<%
							if (request.getParameter("loginVendor") != null) {
								
								out.println("Invalid Username/Password....Please try again...<br/>");
							}
						%>
						<a href="vendor.jsp">Register User</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>