<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="template/header.html"%>
<%@ include file="template/body.html"%>

<form id="vendor" action="VendorController">

	<div class="register">
		<div class="reg-header">
			<h2>Register your Account</h2>
			<div class="strip"></div>
		</div>
		<div class="register-grids">
			<div class="register-left">
				<img src="template/images/hhh.jpg" alt="" /> <input type="submit"
					value="Upload"> a photo <input type="file"
					value="Choose file..">
			</div>
			<div class="register-right">
				<div class="user-form">

					<h3>NAME</h3>
					<input type="text" value="Enter Name" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Enter Name';}"
						required="" name="name">

					<h3>ADDRESS</h3>
					<textarea rows="5" cols="40" name="address"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Address';}"
						required=""></textarea>

					<h3>Phone</h3>
					<input type="text" value="Phone" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Phone';}" required=""
						name="phone">

					<h3>EMAIL</h3>
					<input type="email" value="Email" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Email';}" required=""
						name="email">

					<h3>TIN-NO</h3>
					<input type="text" value="TIN-NO" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'TIN-NO';}"
						required="" name="tinNo">

					<h3>SERVICE-TAX</h3>
					<input type="text" value="SERVICE-TAX" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'SERVICE-TAX';}"
						name="serviceTax" required="">

					<h3>REFERENCES</h3>
					<textarea rows="5" cols="40" name="references"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'References';}"></textarea>

					<h3>PASSWORD</h3>
					<input type="password" value="PASSWORD" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'PASSWORD';}"
						name="password" required="">

					<h3>CONFIRM PASSWORD</h3>
					<input type="password" value="PASSWORD" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'PASSWORD';}"
						required=""> <br />
					<br />
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="form-btm">

			<div class="form-left">
				<label><input type="checkbox" name="checkbox" checked=""><i>Recieve
						weekly newsletter?</i></label>
			</div>
			<div class="form-right">
				<input type="submit" value="Save" name="btnSave">
			</div>
			<div class="clearfix">
				<%
					if (session.getAttribute("dbStatus") != null) {
						out.println(session.getAttribute("dbStatus"));
						session.removeAttribute("dbStatus");
					}
				%>
			</div>
		</div>
	</div>

</form>

</body>
</html>