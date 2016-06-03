<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Vendor"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="template/header.html"%>
<%@ include file="template/body.html"%>

<form id="vendor" action="VendorController">

	<%
		if (request.getParameter("editProfile") != null) {
			Vendor vendor = new Vendor();
			int vid = (int) session.getAttribute("vid");

			vendor = (Vendor) session.getAttribute("user");
	%>


	<div class="register">
		<div class="reg-header">
			<h2>Edit Account</h2>
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

					<h3>Vid No</h3>
					<input type="text" readonly="readonly" name="editedVidNo"
						value="<%=vendor.getVid()%>" />

					<h3>NAME</h3>
					<input type="text" name="name" value="<%=vendor.getName()%>" />

					<h3>ADDRESS</h3>
					<textarea rows="5" cols="40" name="address"><%=vendor.getAddress()%></textarea>

					<h3>Phone</h3>
					<input type="text" name="phone" value="<%=vendor.getPhone()%>" />

					<h3>EMAIL</h3>
					<input type="email" name="email" value="<%=vendor.getEmail()%>" />

					<h3>TIN-NO</h3>
					<input type="text" name="tinNo" value="<%=vendor.getTinNo()%>" />

					<h3>SERVICE-TAX</h3>
					<input type="text" name="serviceTax"
						value="<%=vendor.getServiceTax()%> " />

					<h3>REFERENCES</h3>
					<textarea rows="5" cols="40" name="references"><%=vendor.getReferences()%></textarea>

					<h3>PASSWORD</h3>
					<input type="password" name="password"
						value="<%=vendor.getPassword()%>" />

					<h3>CONFIRM PASSWORD</h3>
					<input type="password" name="password"
						value="<%=vendor.getPassword()%>" />

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
				<input type="submit" value="Update" name="btnUpdate1">
			</div>
			<div class="clearfix">
				<%
					if (session.getAttribute("dbStatus") != null) {
							out.println(session.getAttribute("dbStatus"));
							session.removeAttribute("dbStatus");
						}
					}
				%>
			</div>
		</div>
	</div>




</form>


<%@ include file="template/footer.html"%>