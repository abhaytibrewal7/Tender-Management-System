<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="template/header.html"%>
<%@ include file="template/body.html"%>

<form action="AdminController">



	<div class="register">
		<div class="reg-header">
			<h2>Create New Tender</h2>
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

					<h3>TENDER NAME</h3>
					<input type="text" value="Enter Name" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Enter Name';}"
						required="" name="tName">

					<h3>OPENING DATE</h3>
					<input type="date"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Enter Date';}"
						required="" name="tOpeningDate">

					<h3>OPENING TIME</h3>
					<input type="time" value="time" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'time';}" required=""
						name="tOpeningTime">

					<h3>CLOSING DATE</h3>
					<input type="date" value="Date" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Enter Date';}" required=""
						name="tClosingDate">
					<h3>CLOSING TIME</h3>
					<input type="time" value="ClosingTime" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'ClosingTime';}"
						required="" name="tClosingTime">

					<h3>ENTER MINIMUM BID-PRICE</h3>
					<input type="number" value="MinBidPrice" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'MinBidPrice';}"
						name="minBid" required="">

					<h3>ENTER TENDER DESCRIPTION</h3>
					<textarea rows="5" cols="40" name="tDesc"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'tenderDescription';}"></textarea>

					<br />
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="form-btm">

			<div class="form-left">
				<label><input type="checkbox" name="checkbox" checked=""><i>Receive
						weekly newsletter?</i></label>
			</div>
			<div class="form-right">
				<input type="submit" value="Submit" name="btnSubmit">
				
			</div>
			<div class="clearfix">
			<%
		if (session.getAttribute("msg") != null) {
			out.println(session.getAttribute("msg"));
		}

	%>
			</div>
		</div>
	</div>

</form>
<h3>
		</h3>
<%@ include file="template/footer.html"%>