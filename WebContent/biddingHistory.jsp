<%@page import="java.util.Iterator"%>
<%@page import="model.Tender"%>
<%@page import="dao.VendorFunctionsImpl"%>
<%@page import="java.util.ListIterator"%>
<%@page import="model.Bid"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="template/header.html"%>
<%@ include file="template/body.html"%>

<body>

	<%
		if (request.getAttribute("bList") != null) {
			ArrayList<Bid> bList = new ArrayList<Bid>();
			bList = (ArrayList<Bid>) request.getAttribute("bList");
			Iterator<Bid> it = bList.iterator();
	%>
	<div class="shopping-chart">
		<div class="shop-header">
			<h3>Bid History</h3>
			<div class="strip"></div>
		</div>
		<%
			while (it.hasNext()) {
					Bid bid = it.next();
		%>
		<ul>
			<li>
				<div class="shop-grids">
					<div class="shop-img">
						<img src="template/images/eee.jpg" alt="" />
					</div>
					<div class="shop-info">
						<h4>
							<%
							VendorFunctionsImpl v = new VendorFunctionsImpl();
									Tender tender = v.viewTenderById(bid.getTid());
						%><%=tender.gettName()%></h4>
						<p>
							Tender ID:<%=bid.getTid()%></p>
						<p>
							Bid ID :<%=bid.getBid()%></p>
						<p>
							Bid Amount :<%=bid.getBidAmount()%></p>
						<p>
							Bid Time:<%=bid.getBidTime()%></p>

					</div>
					<div class="shop-count">
						<p>
							Selection Status:
							<%=bid.getSelectBid()%></p>

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