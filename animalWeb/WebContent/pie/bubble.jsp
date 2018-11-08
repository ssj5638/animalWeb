<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE HTML>
<html>
<head>  
<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title:{
		text: "-"
	},
	axisX: {
		title:"Life Expectancy (in Years)"
	},
	axisY: {
		title:"Fertility Rate"
	},
	legend:{
		horizontalAlign: "left"
	},
	data: [{
		type: "bubble",
		showInLegend: true,
		legendText: "Size of Bubble Represents Population in Millions",
		legendMarkerType: "circle",
		legendMarkerColor: "grey",
		toolTipContent: "<b>{name}</b><br/> Dogs: {x}<br/> Cats: {y}<br/> Population: {z}(천명)",
		dataPoints: [
			{ x: 4042	, y: 681	, z: 1521	, name: "강원도" },
			{ x: 16948	, y: 5625	, z: 12809	, name: "경기도" },
			{ x: 7179	, y: 705	, z: 3355	, name: "경상남도" },
			{ x: 4191	, y: 659	, z: 2681	, name: "경상북도" },
			{ x: 1768	, y: 1859	, z: 1501	, name: "광주광역시" },
			{ x: 2344	, y: 1775	, z: 2465	, name: "대구광역시" },
			{ x: 2969	, y: 1452	, z: 1531	, name: "대전광역시" },
			{ x: 3988	, y: 3317	, z: 3429	, name: "부산광역시" },
			{ x: 5578	, y: 2719	, z: 9776	, name: "서울특별시" },
			{ x: 214	, y: 125	, z: 276	, name: "세종특별자치시" },
			{ x: 1601	, y: 1258	, z: 1166	, name: "울산광역시" },
			{ x: 3943	, y: 2022	, z: 2923	, name: "인천광역시" },
			{ x: 3110	, y: 1084	, z: 1796	, name: "전라남도" },
			{ x: 3669	, y: 825	, z: 1830	, name: "전라북도" },
			{ x: 4505	, y: 313	, z: 634	, name: "제주특별자치도" },
			{ x: 4125	, y: 1450	, z: 2148	, name: "충청남도" },
			{ x: 2849	, y: 674	, z: 1605	, name: "충청북도" }
		]
	}]
});
chart.render();

}
</script>
</head>
<body>
<div id="chartContainer" style="height: 100%; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
