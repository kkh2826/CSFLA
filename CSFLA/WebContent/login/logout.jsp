<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//로그아웃주석
	session.invalidate();
	response.sendRedirect("../main/index.jsp");
%>    
