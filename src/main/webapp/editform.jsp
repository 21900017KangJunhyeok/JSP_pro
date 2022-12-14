<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");	
	BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
	request.setAttribute("vo",u);
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
<table>
<tr><td>분류:</td><td><input type="text" name="category" value="<%= u.getCategory()%>"/></td></tr>
<tr><td>직업:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
<tr><td>이름:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>
<tr><td>나이:</td><td><input type="text" name="age" value="<%= u.getAge()%>" /></td></tr>
<tr><td>자기소개:</td><td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td></tr>
<tr><td>사진:</td><td><input type="file" name="photo" value="<%= u.getPhoto()%>" /><br/>
<img src = "${pageContext.request.contextPath}/upload/<%=u.getPhoto() %>" class="photo" width="50" height="50"></td></tr>
<tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>