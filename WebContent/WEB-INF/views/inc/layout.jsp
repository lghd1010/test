<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/favicon.ico" />
<style type="text/css">
div#one,div.jumbotron {
background-size:  100% 100%;
background-image:url('images/common/c3.jpg');
background-repeat: no-repeat;
padding:120px;

}

</style>
</head>
<body>
	
	<!-- header 영역 -->
	<tiles:insertAttribute name="header" />

	<!-- main 영역 -->
	<div id="main">
		<div class="top-wrapper clear">
			<tiles:insertAttribute name="content" />
		</div>
	</div>

	<!-- footer 영역 -->
	<tiles:insertAttribute name="footer" />
	
	<!-- javascript 영역 -->
	<script type="text/javascript" src='<tiles:getAsString name="js"/>' ></script>
	
</body>
</html>