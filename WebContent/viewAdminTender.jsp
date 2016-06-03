<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Tender"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="template/header.html" %>
<%@ include file="template/body.html" %>
<body>
			<% if(session.getAttribute("tList")!= null){
	 			List tList = (List)session.getAttribute("tList");
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
						<h4><a href="AdminController?tid=<%=t.gettId()%>"><%=t.gettName()%></a></h4>
						<p>Opening Date:<%=t.getOpening() %></p>
						<p>Closing Date :<%=t.getClosing() %></p>
						<p>Minimum Bid :<%=t.getMinBid() %></p>
						<p>Tender Description :<%=t.gettDesc() %></p>
						
						</div>
					<div class="shop-price">
						<p><a href="AdminController?deleteTid=<%=t.gettId() %>" >Delete</a></p>
					</div>
					<div class="shop-count">
						<p><%=t.gettId() %></p>
						
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
<%@ include file="template/footer.html"%>