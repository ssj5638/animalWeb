<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="animalWeb.DBConn" %>
<%
Connection conn = DBConn.getMySqlConnection();

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT orgNm_Pre,COUNT(*) as count FROM animal_re where happenDt like '2015%' and kind='0' GROUP BY orgNm_Pre ORDER BY orgNm_Pre asc;";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

Gson gsonObj = new Gson();
Map<Object, Object> map = null;
List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

while(rs.next()){
	map = new HashMap<Object, Object>();
	map.put("label", rs.getString("orgNm_Pre"));
	map.put("y", rs.getInt("count"));
	list.add(map);
}

String dataPoints = gsonObj.toJson(list);
System.out.println(dataPoints);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
window.onload = function(){
	var chart = new CanvasJS.Chart("orgNm", {
		animationEnabled:true,
		theme: "light2",
		title:{
			text: "보호 관할 지역"
		},
		data:[{
			type:"column",
			yValueFormatString:"#,##0",
//			indexLabel: "{label}: {y}",
			dataPoints: <%out.print(dataPoints);%>
		}]
	});
	chart.render();
}
</script>
<title>Insert title here</title>
</head>
<body>
<div id="orgNm" style="height:200px; width:200px;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>