<%@page import="dao.VendorFunctionsImpl"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Tender"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="template/header.html" %>
<%@ include file="template/body.html" %>
    
			<% if(session.getAttribute("cList")!= null){
	 			List tList = (List)session.getAttribute("cList");
	 			ListIterator it = tList.listIterator();
	 		%>
	 		<div class="shopping-chart">
		<div class="shop-header">
			<h3>List Of Tenders</h3>
			<div class="strip"></div>
		</div>
	<%
	 		while(it.hasNext()){
	 			Tender t = new Tender();
	 			t = (Tender) it.next();
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
							boolean abc=v.hasBidPlaced(t.gettId(), (int)session.getAttribute("vid"));
							out.println(abc);											
						%></p>
						
						
						</div>
					<div class="shop-price">
						<p></p>
						<p></p>
					</div>
					<div class="shop-count">
						<p><a href="tenderInfo.jsp?tid=<%=t.gettId() %>">View Tender</a></p>
						
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
<%@ include file="template/footer.html"%>