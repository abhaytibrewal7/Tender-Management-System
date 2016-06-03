<%@page import="dao.VendorFunctionsImpl"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Tender"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="template/header.html" %>
<%@ include file="template/body.html" %>
    
    <form action="VendorController" >
    
    
			<% 
				String a=request.getParameter("tid");
				int tid = Integer.parseInt(request.getParameter("tid"));
				boolean abc;
			
	 		%>
	 		<div class="shopping-chart">
		<div class="shop-header">
			<h3>Place Bid </h3>
			<div class="strip"></div>
		</div>
	<%
				VendorFunctionsImpl vimp = new VendorFunctionsImpl();
	 			Tender t = new Tender();
	 			t = vimp.viewTenderById(tid);
	 	%>
	<ul>
			<li>
				<div class="shop-grids">
					<div class="shop-img">
						<img src="template/images/eee.jpg" alt="" />
					</div>
					<div class="shop-info">
						<h4><%=t.gettName()%></h4>
						<p>Opening Date:<%=t.getOpening() %></p>
						<p>Closing Date :<%=t.getClosing() %></p>
						<p>Minimum Bid :<%=t.getMinBid() %></p>
						<p>Tender Description :<%=t.gettDesc() %></p>
						<p>Bid Placed : <%
							VendorFunctionsImpl v=new VendorFunctionsImpl();
							abc=v.hasBidPlaced(t.gettId(), (int)session.getAttribute("vid"));
							out.println(abc);											
						%></p>
						
						</div>
					<div class="shop-price">
						<p></p>
						<p></p>
					</div>
					<%if (abc != true){ %>
					<div class="shop-count">
						<p><input type="number" name="bidAmt"/>
							<input type="hidden" name="tid" value="<%=a %>" />							
						</p>
						<p><input type="submit" name="btnPlaceBid" value="Place Bid" /></p>
						
					</div>
					<%} %>
					<div class="clearfix">
					<%
						//out.println(session.getAttribute("dbStatus"));
					%>
					</div>
				</div>
			</li>
		
		</ul>
	</div>
	</form>
<%@ include file="template/footer.html"%>