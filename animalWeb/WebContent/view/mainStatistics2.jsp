<%-- 2페이지 화면 구성 --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<style>

	*{
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	}
	
	html,body{
		width:100%;
		height:100%;
		margin:0;
		padding:0;
	}
	
	.wrap {
		width:100%;
		height:100%;
		position:absolute;
		margin: 0;
		padding: 0;
	}
	
	#top_graph{
		width:100%;
		height:371px;
		position:relative;
	}
	
	#bottom_graph{
		width:100%;
		height:100%;
		position:relative;
	}
		
	.pieZone{
		float: left;
		width:100%;
		height:100%;
	}
		
	.graphZone{
		float: right;
		width:100%;
		height:100%;
	}

	#menu_wrap{
		width:60%;
		height:20%;
		position:relative;
		margin:auto; 
		padding: 0px 0px 0px 0px;

	}
	
	.area2_menu{
		background-image:url(../css/imageFile/gsonTest.j);
		background-repeat: no-repeat;
		background-size:contain;
		background-position: center;
		box-shadow: 0 15px 20px rgba(0, 0, 0, 0.3); 
		border-radius:5px;
		border: 1px solid black;
		width:20%;
		height:80%;
		float:left;
		position:relative;
		margin:1% 2.5% 0% 2.5% ;
		padding: 0;
	
	
	}
	
	.iframe{
		width:99%;
		height:99%;
		position:relative;
		margin:0% 0.5% 0% 0.5%;
		background-color:white;
		border-radius: 10px;
		border: 0;
	}
	


</style>
</head>
<body>
	<div class="wrap">
		<div id=top_graph>
			<iframe class="iframe" src="../olddata/allGraph.jsp"></iframe>	
		</div>
		<div id=bottom_graph>
			<div id="selectBox">
					<form action="../pie/pieAll2.jsp" target="iframe1">
						<select name = "year">
							<option value = 2017> 2017 </option>
							<option value = 2016> 2016 </option>
							<option value = 2015> 2015 </option>
						</select>
						<select name = "kind">
							<option value = "0"> 개 </option>
							<option value = "1"> 고양이 </option>
						</select>
						<input type="submit" value="보내기"> 
					</form>
				</div>
				
			<div class="pieZone">
				<iframe class='iframe' name='iframe1' src="../pie/pieBase.jsp" ></iframe>
			</div>
		</div>
	</div>
	</body>
</html>