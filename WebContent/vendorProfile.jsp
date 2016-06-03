<%@page import="model.Vendor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="template/header.html" %>
<%@ include file="template/body.html" %>
<% if(session.getAttribute("user")!=null){
	Vendor vendor=(Vendor)session.getAttribute("user");
	session.setAttribute("vid", vendor.getVid());
	out.println(vendor.getVid());
}
	%>
<%@ include file="template/profile.jsp" %>
<%@ include file="template/footer.html"%>