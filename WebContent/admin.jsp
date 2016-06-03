<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="template/header.html"%>
<%@ include file="template/body.html"%>
<%
	if (session.getAttribute("adminId") != null) {
%>
<div class="shopping-chart">
	<div class="shop-header">
		<h3>Admin Functions</h3>
		<div class="strip"></div>
	</div>
	<ul>
		<li>
			<div class="shop-grids">
				<div class="shop-img">
					<img src="template/images/eee.jpg" alt="" />
				</div>
				<div class="shop-info">
					<h4>
						<a href="createTender.jsp">Create a Tender</a>
					</h4>
					<h4>
						<a href="AdminController?viewTender">View All Tenders</a>
					</h4>
					<h4>
						<a href="createVendorAdmin.jsp">Create Vendors</a>
					</h4>
					<h4>
						<a href="VendorController?viewVendorAdmin=true">View All
							Vendors</a>
					</h4>
				</div>
				<div class="shop-price"></div>
				<div class="shop-count"></div>
				<div class="clearfix"></div>
			</div>
		</li>
	</ul>
</div>
<div class="clear-fix">
</div>
<%
	} else {

		response.sendRedirect("adminLogin.jsp");

	}
%>
<%@ include file="template/footer.html"%>