<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Vendor"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="template/header.html"%>
<%@ include file="template/body.html"%>

<form id="vendor" action="VendorController">
	<%
		if (request.getParameter("editVid") == null) {
	%>

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
				<input type="submit" value="Save" name="btnSave1">
			</div>
			<div class="clearfix"><%
	 	if(session.getAttribute("dbStatus")!=null){
			out.println(session.getAttribute("dbStatus"));
			session.removeAttribute("dbStatus");			
		}
	 %>	</div>
		</div>
	</div>
	<%
		} else if (request.getParameter("editVid") != null) {

			Vendor vendor = new Vendor();
			int vid = Integer.parseInt(request.getParameter("editVid"));
			ArrayList editList = (ArrayList) getServletContext()
					.getAttribute("vList"); //getServletContext se cList me value hmesha hi rahega..usko abhi use kar le
			ListIterator it = editList.listIterator();
			while (it.hasNext()) {
				vendor = (Vendor) it.next();
				if (vid == vendor.getVid()) {
					break;
				}
			}
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
				<input type="submit" value="Update" name="btnUpdate">
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

	<%
		}
	%>

</form>


<%@ include file="template/footer.html"%>