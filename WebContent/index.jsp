<%@page import="helpers.WebApplicationHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cookies</title>
</head>
<body>
<h1>Test de cookies</h1>
<%
	String name = WebApplicationHelper.getCookieValue(request, "name");
	System.out.println(">>> "+name);
	if(name!=null){
		out.print("<h2>Bonjour, "+name+"</h2>");
	}else{
		name = request.getParameter("name");
		if(name!=null && !name.equals("")){
			out.print("<h2>Bonjour, "+name+"</h2>");
			WebApplicationHelper.setCookie(response, "name", name, 365);
		}
		else{
%>
	<jsp:include page="fragments/form_name.jsp">
		<jsp:param name="actionUrl" value="index.jsp"/>
	</jsp:include>
<%} }%>
</body>
</html>