<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>();
map.put("label", "Australia"); 
map.put("y", 81000); 
list.add(map);
map = new HashMap<Object,Object>();
map.put("label", "China"); 
map.put("y", 47000);
list.add(map);
map = new HashMap<Object,Object>();
map.put("label", "Brazil");
map.put("y", 32500);
list.add(map);
map = new HashMap<Object,Object>();
map.put("label", "Guinea");
map.put("y", 19300);
list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "India"); map.put("y", 19000); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Jamaica"); map.put("y", 9800); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Kazakhstan"); map.put("y", 5500); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Russia"); map.put("y", 5300); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Others"); map.put("y", 15060); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
System.out.println(dataPoints);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "World Bauxite Production"
	},
	subtitles: [{
		text: "in tonnes"
	}],
	data: [{
		type: "doughnut",
		yValueFormatString: "#,##0",
		indexLabel: "{label}: {y}K",
		toolTipContent: "{y}K tonnes",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>