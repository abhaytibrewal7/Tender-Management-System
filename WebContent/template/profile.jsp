<%@page import="model.Vendor"%>
<div class="follow">
	<div class="follow-img">
	</div>
	<div class="follow-info">
	
		<%
			Vendor vendor=new Vendor();
			vendor=(Vendor)session.getAttribute("user");
		%>
	
		<h4><%=vendor.getName() %></h4>
		<p>
			<b>Address :</b> <%=vendor.getAddress() %>
		</p>
		<p>
			<b>Phone :</b> <%=vendor.getPhone() %>
		</p>
		<p>
			<b>Email Address :</b> <%=vendor.getEmail() %>
		</p>
		<p>
			<b>Tin No :</b> <%=vendor.getTinNo() %>
		</p>
		<p>
			<b>Service Tax :</b> <%=vendor.getServiceTax() %>
		</p>
		<p>
			<b>References :</b> <%=vendor.getReferences() %>
		</p> 
		<a href="VendorController?viewTender">View Available Tenders</a><br />
		<a href="VendorController?bidHistory=true">View Bid History</a><br />
		<a href="editVendorProfile.jsp?editProfile=true">Edit Profile</a>
	</div>
	<div class="follow-grids">
		<div class="follow-grid">
			<h5>
				356 <span>NO OF BIDS PLACED</span>
			</h5>
		</div>
		<div class="follow-grid">
			<h5>
				1,569 <span>NO OF TENDERS ACHIEVED</span>
			</h5>
		</div>
		<div class="follow-grid">
			<h5>
				1,203 <span>SUCCESS RATE</span>
			</h5>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="follow-pos">
		<img src="template/images/pic5.jpg" alt="" />
	</div>
</div>