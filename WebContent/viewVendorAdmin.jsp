<%@page import="model.Vendor"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="template/header.html"%>
<%@ include file="template/body.html"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<body>

	<%
		if (getServletContext().getAttribute("vList") != null) {
			ArrayList<Vendor> c = (ArrayList) getServletContext()
					.getAttribute("vList");

			ListIterator it = c.listIterator();
	%>

	<div class="shopping-chart">
		<div class="shop-header">
			<h3>List Of Vendors</h3>
			<div class="strip"></div>
		</div>
		<%
			while (it.hasNext()) {
					Vendor vendor = new Vendor();
					vendor = (Vendor) it.next();
		%>

		<ul>
			<li>
				<div class="shop-grids">
					<div class="shop-img">
						<img src="template/images/eee.jpg" alt="" />
					</div>
					<div class="shop-info">
						<h4><%=vendor.getName()%></h4>
						<p>Address :<%=vendor.getAddress() %></p>
						<p>Phone :<%=vendor.getPhone()%></p>
						<p>Email :<%=vendor.getEmail()%></p>
						<p>Tin No :<%=vendor.getTinNo()%></p>
						<p>Service Tax :<%=vendor.getServiceTax()%></p>
						<p>References :<%=vendor.getReferences()%></p>
				
						</div>
					<div class="shop-price">
						<p><a href="VendorController?deleteVid=<%=vendor.getVid() %>" >Delete</a></p>
						<p><a href="createVendorAdmin.jsp?editVid=<%=vendor.getVid() %>" >Edit</a></p>
					</div>
					<div class="shop-count">
						<p><%=vendor.getVid() %></p>
						
					</div>
					<div class="clearfix"></div>
				</div>
			</li>
			<%
		}
		}
	%>
			
		</ul>
	</div>

	
</body>
</html>
<%@ include file="template/footer.html"%>