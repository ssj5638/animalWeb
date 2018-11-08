<%-- select ���� �޾� Pie �׷��� �׸��� --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="animalWeb.DBConn" %>
<%	
Connection conn = DBConn.getMySqlConnection();

// Parameter
PreparedStatement rePstmt = null;
ResultSet reRs = null;

request.setCharacterEncoding("euc-kr");

String reYear = request.getParameter("year");
String reKind = request.getParameter("kind");

String strKind = null;

if (reKind.equals("1")){	// �ι�° �Ķ���ͷ� �������� �Է��� �� �ֵ��� ���� ��
	strKind = "Cats";
}else{
	strKind = "Dogs";
}

//System.out.println(reYear);		// ù��° �Ķ���� Ȯ��
//System.out.println(reKind);		// �ι�° �Ķ���� Ȯ��


String reSql = "select count(case when processState_Pre='C' then 1 end) as C, " + 
				"count(case when processState_Pre='A' then 1 end) as A, " + 
				"count(case when processState_Pre='D' then 1 end) as D, " + 
				"count(case when processState_Pre='R' then 1 end) as R,	" + 
				"count(case when processState_Pre='E' then 1 end) as E " +
				"from animal_re where happenDt like ? and kind=?;";

				
rePstmt = conn.prepareStatement(reSql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
rePstmt.setString(1, reYear+'%');
rePstmt.setString(2, reKind);

//System.out.println(rePstmt);		// ������ Ȯ��

reRs = rePstmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
int total = 0;
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

while(reRs.next()){
	map = new HashMap<Object, Object>();
	map.put("label", "�Ծ�/����");
	map.put("y", reRs.getInt("A"));
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("label", "�ȶ���/�ڿ���");
	map.put("y", reRs.getInt("D"));
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("label", "��ȯ");
	map.put("y", reRs.getInt("R"));
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("label", "��Ÿ");
	map.put("y", reRs.getInt("C")+reRs.getInt("E"));
	list.add(map);
	total = reRs.getInt("A")+reRs.getInt("D")+reRs.getInt("R")+reRs.getInt("C")+reRs.getInt("E");
}	
String dataPoints = gsonObj.toJson(list);
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	.wrap {
		width:100%;
		height:95%;
		position:absolute;
		margin: 0;
		padding: 0;
	}
	.graphZone1{
		float: left;
		width:30%;
		height:100%;
	}
		
	.graphZone2{
		float: right;
		width:70%;
		height:100%;
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
<script type="text/javascript">
window.onload = function() { 
	
var totalVisitors = <%out.print(total);%>;

var abandonedData = {
		"Abandoned Animal": [{
			cursor: "pointer",
			explodeOnClick: false,
			innerRadius: "60%",
			legendMarkerType: "square",
			name: "Abandoned Animal",
			radius: "75%",
			showInLegend: true,
			startAngle: 0,
			type: "doughnut",
			yValueFormatString: "#,##0",
			indexLabel: "{label}: {y}",
			toolTipContent: "{y}",
			dataPoints: <%out.print(dataPoints);%>
		}]
};

var pieOptions = {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "2017�� ���⵿�� ��ȣ����"
		},
		legend: {
			fontFamily: "calibri",
			fontSize: 14,
			itemTextFormatter: function (e) {
				return e.dataPoint.label + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
			}
		},
	data: []
};

var chart = new CanvasJS.Chart("chartContainer", pieOptions);
chart.options.data = abandonedData["Abandoned Animal"];
chart.render();

}
</script>
</head>
<body>
<div class="wrap">
	<div class="graphZone1">
		<div id="chartContainer" style="height: 70%; width: 99%;"></div>
	</div>
	<div class="graphZone2">
		<iframe class="iframe" src="bubble.jsp"></iframe>
	</div>
</div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>