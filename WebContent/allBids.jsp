<%@page import="model.Tender"%>
<%@page import="dao.VendorFunctionsImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="model.Bid"%>
<%@ include file="template/header.html"%>
<%@ include file="template/body.html"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>



<%
	if (session.getAttribute("bidList") != null) {
		List<Bid> bList = (List<Bid>) session.getAttribute("bidList");
		ListIterator it = bList.listIterator();
%>
<div class="shopping-chart">
	<div class="shop-header">
		<h3>All Bids List</h3>
		<div class="strip" style="font-size: 20px" ><center>
			<%
				if (request.getAttribute("vid") != null) {
						out.print("<br/><b>Vendor selected for this Tendor is :</b>");
						out.println("<b>"+request.getAttribute("vid")+"</b></br>");
					}
			%>
		</center>
		</div>
	</div>
	<%
		while (it.hasNext()) {

				Bid b = new Bid();
				b = (Bid) it.next();
			
				VendorFunctionsImpl v = new VendorFunctionsImpl();
						Tender tender = v.viewTenderById(b.getTid());
			
	%>
	<ul>
		<li>
			<div class="shop-grids">
				<div class="shop-img">
					<img src="template/images/eee.jpg" alt="" />
				</div>
				<div class="shop-info">
					<h4>
						Vendor Name:<%=b.getVid()%></h4>
					<p>
						Tender Name :<%=tender.gettName()%>
					</p>
					<p>
						Tender ID:<%=b.getTid()%></p>
					<p>
						Bid ID:<%=b.getBid()%></p>
					<p>
						Bid Amount :<%=b.getBidAmount()%></p>
					<p>
						Bid Time<%=b.getBidTime()%></p>
					<p>
						Bid Status:<%=b.getSelectBid()%></p>


				</div>
				<div class="shop-count">
					<p><%=b.getVid()%></p>
				</div>

				<div class="clearfix"></div>
			</div>
		</li>
		<%
			}
			}
		%>

	</ul>
	<center>
	<%
		String tidSelectBid= (String)session.getAttribute("tid");
	%>
		<a href="AdminController?selectBid=true&tidSelectBid=<%=tidSelectBid%>">Select Bid</a>
	</center>
</div>
</body>
</html>
<%@ include file="template/footer.html"%>