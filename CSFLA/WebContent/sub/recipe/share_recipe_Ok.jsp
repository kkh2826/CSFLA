<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="Recipe.RecipeDTO"></jsp:useBean>
<jsp:useBean id="dao" class="Recipe.RecipeDAO"></jsp:useBean>
<jsp:useBean id="dto2" class="RecipeFile.RecipeFileDTO"></jsp:useBean>
<jsp:useBean id="dao2" class="RecipeFile.RecipeFileDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	String subpath = "/RECIPE_CONTENT/";
	String path = System.getProperty("catalina.home") + subpath;
	/* String path = request.getServletContext().getRealPath("c:/RECIPE_CONTENT"); */  
	int maxsize = 1024*1024*10;
	
	MultipartRequest multi = new MultipartRequest(request, path, maxsize, "EUC-KR", new DefaultFileRenamePolicy());
	
	Enumeration files = multi.getFileNames();
	
	String userId = (String)session.getAttribute("id"); 
	String recipeTitle = multi.getParameter("recipeTitle");
	String writer = multi.getParameter("writer");
	String recipeContent = multi.getParameter("recipeContent");
	String recipeImage = "";
	
	if(dao.insertRecipe(recipeTitle, writer, recipeContent) == dao.SHARE_RECIPE_OK) { 
		int recipeNum= dao.getRecipeNum();
		while(files.hasMoreElements()) {
			String parameter = (String)files.nextElement();
			String originalFile = multi.getOriginalFileName(parameter);
			recipeImage = multi.getFilesystemName(parameter);
			
			String fileType = multi.getContentType(parameter);
			System.out.println(originalFile);
			System.out.println(fileType);
			if(originalFile == null) continue;
			if(originalFile.endsWith(".jpg") || originalFile.endsWith(".jpeg") || originalFile.endsWith(".png") ||
					originalFile.endsWith(".avi") || originalFile.endsWith(".mpeg") || originalFile.endsWith(".mpg") || originalFile.endsWith(".mp4")) {
				
					if(dao2.insertRecipeFile(writer, originalFile, fileType, recipeNum) > 0) {
	%>
						<script language="javascript">
							alert("레시피 공유를 했습니다.");
							document.location.href="share_recipe_list.jsp";
						</script>
	<%			
					}
				} else {
	%>
					<script language="javascript">
						alert("지원하지 않는 확장자입니다.");
						history.go(-1);
					</script>
	<%		
					}
			}
		} else {
%>
		<script language="javascript">
			alert("실패했습니다.");
			history.go(-1);
		</script>
<%		
		}
	
%>	
	
  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>