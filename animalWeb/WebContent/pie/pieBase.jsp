<%-- 기본 Pie 그래프 (selectBox에서 값을 받기 전에 나타나도록 함) --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="animalWeb.DBConn" %>
<%
	Connection conn = DBConn.getMySqlConnection();

	PreparedStatement pstmtPie = null;
	ResultSet rsPie = null;

	String sqlPie = "select count(case when processState_Pre='C' then 1 end) as C, " + 
					"count(case when processState_Pre='A' then 1 end) as A, " + 
					"count(case when processState_Pre='D' then 1 end) as D, " + 
					"count(case when processState_Pre='R' then 1 end) as R,	" + 
					"count(case when processState_Pre='E' then 1 end) as E " +
					"from animal_re where kind='0' and happenDt like '2017%';";
					
	pstmtPie = conn.prepareStatement(sqlPie); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
	
	rsPie = pstmtPie.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 
	
	int total = 0;
	
	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	while(rsPie.next()){
		map = new HashMap<Object, Object>();
		map.put("label", "입양/기증");
		map.put("y", rsPie.getInt("A"));
		map.put("color", "#6d78ad");
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "안락사/자연사");
		map.put("y", rsPie.getInt("D"));
		map.put("color", "#51cda0");
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "반환");
		map.put("y", rsPie.getInt("R"));
		map.put("color", "#df7970");
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "기타");
		map.put("y", rsPie.getInt("C")+rsPie.getInt("E"));
		map.put("color", "#4c9ca0");
		list.add(map);
		
		total = rsPie.getInt("A")+rsPie.getInt("D")+rsPie.getInt("R")+rsPie.getInt("C")+rsPie.getInt("E");
	}	
	String dataPoints = gsonObj.toJson(list);
	//System.out.println(total);
	//System.out.println(dataPoints);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "강원도"); map.put("y", 1529); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "경기도"); map.put("y", 6822); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "경상남도"); map.put("y", 2590); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "경상북도"); map.put("y", 1575); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "광주광역시"); map.put("y", 695); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "대구광역시"); map.put("y", 744); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "대전광역시"); map.put("y", 781); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "부산광역시"); map.put("y", 801); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "서울특별시"); map.put("y", 1632); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "세종특별자치시"); map.put("y", 88); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "울산광역시"); map.put("y", 712); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "인천광역시"); map.put("y", 1250); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "전라남도"); map.put("y", 1138); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "전라북도"); map.put("y", 1170); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "제주특별자치도"); map.put("y", 736); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "충청남도"); map.put("y", 1632); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "충청북도"); map.put("y", 1280); list.add(map);
	String a17orgNm = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "강원도"); map.put("y", 1206); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "경기도"); map.put("y", 6551); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "경상남도"); map.put("y", 3158); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "경상북도"); map.put("y", 1875); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "광주광역시"); map.put("y", 557); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "대구광역시"); map.put("y", 1025); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "대전광역시"); map.put("y", 1237); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "부산광역시"); map.put("y", 2271); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "서울특별시"); map.put("y", 1914); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "세종특별자치시"); map.put("y", 99); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "울산광역시"); map.put("y", 276); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "인천광역시"); map.put("y", 1628); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "전라남도"); map.put("y", 1245); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "전라북도"); map.put("y", 2010); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "제주특별자치도"); map.put("y", 3398); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "충청남도"); map.put("y", 1464); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "충청북도"); map.put("y", 954); list.add(map);
	String d17orgNm = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "강원도"); map.put("y", 890); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "경기도"); map.put("y", 3552); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "경상남도"); map.put("y", 855); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "경상북도"); map.put("y", 446); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "광주광역시"); map.put("y", 485); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "대구광역시"); map.put("y", 575); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "대전광역시"); map.put("y", 938); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "부산광역시"); map.put("y", 847); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "서울특별시"); map.put("y", 2010); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "세종특별자치시"); map.put("y", 27); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "울산광역시"); map.put("y", 343); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "인천광역시"); map.put("y", 1040); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "전라남도"); map.put("y", 412); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "전라북도"); map.put("y", 402); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "제주특별자치도"); map.put("y", 365); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "충청남도"); map.put("y", 441); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "충청북도"); map.put("y", 568); list.add(map);
	String r17orgNm = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "1월"); map.put("y", 1835); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "2월"); map.put("y", 1802); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "3월"); map.put("y", 2263); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "4월"); map.put("y", 2145); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "5월"); map.put("y", 2200); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "6월"); map.put("y", 2009); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "7월"); map.put("y", 2505); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "8월"); map.put("y", 2574); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "9월"); map.put("y", 2137); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "10월"); map.put("y", 2081); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "11월"); map.put("y", 1921); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "12월"); map.put("y", 1703); list.add(map);
	String a17happenMth = gsonObj.toJson(list);	
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "1월"); map.put("y", 1743); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "2월"); map.put("y", 1671); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "3월"); map.put("y", 2029); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "4월"); map.put("y", 2080); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "5월"); map.put("y", 2280); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "6월"); map.put("y", 2496); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "7월"); map.put("y", 3283); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "8월"); map.put("y", 3727); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "9월"); map.put("y", 3126); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "10월"); map.put("y", 2978); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "11월"); map.put("y", 2876); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "12월"); map.put("y", 2679); list.add(map);
	String d17happenMth = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "1월"); map.put("y", 874); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "2월"); map.put("y", 816); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "3월"); map.put("y", 1057); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "4월"); map.put("y", 1216); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "5월"); map.put("y", 1440); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "6월"); map.put("y", 1316); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "7월"); map.put("y", 1501); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "8월"); map.put("y", 1531); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "9월"); map.put("y", 1384); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "10월"); map.put("y", 1225); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "11월"); map.put("y", 1012); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "12월"); map.put("y", 824); list.add(map);
	String r17happenMth = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "유견기"); map.put("y", 12751); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "성견기"); map.put("y", 12063); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "노년기"); map.put("y", 361); list.add(map);
	String a17age = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "유견기"); map.put("y", 13985); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "성견기"); map.put("y", 15258); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "노년기"); map.put("y", 1725); list.add(map);
	String d17age = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "유견기"); map.put("y", 3278); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "성견기"); map.put("y", 9686); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "노년기"); map.put("y", 1232); list.add(map);
	String r17age = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "미상"); map.put("y", 96); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "초소형"); map.put("y", 9423); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "소형"); map.put("y", 11043); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "중형"); map.put("y", 4060); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "대형"); map.put("y", 553); list.add(map);
	String a17size = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "미상"); map.put("y", 116); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "초소형"); map.put("y", 10330); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "소형"); map.put("y", 14499); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "중형"); map.put("y", 5672); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "대형"); map.put("y", 351); list.add(map);
	String d17size = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "미상"); map.put("y", 64); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "초소형"); map.put("y", 2982); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "소형"); map.put("y", 7076); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "중형"); map.put("y", 3298); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "대형"); map.put("y", 776); list.add(map);
	String r17size = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 285); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Female"); map.put("y", 11527); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Male"); map.put("y", 13363); list.add(map);
	String a17sex = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 417); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Female"); map.put("y", 14504); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Male"); map.put("y", 16047); list.add(map);
	String d17sex = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 63); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Female"); map.put("y", 5962); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Male"); map.put("y", 8171); list.add(map);
	String r17sex = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 7325); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "yes"); map.put("y", 1784); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "no"); map.put("y", 16066); list.add(map);
	String a17neuter = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 9876); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "yes"); map.put("y", 1230); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "no"); map.put("y", 19862); list.add(map);
	String d17neuter = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 4979); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "yes"); map.put("y", 1946); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "no"); map.put("y", 7271); list.add(map);
	String r17neuter = gsonObj.toJson(list);
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
		width:69%;
		height:100%;
	}
	.graphPart1{
		width:100%;
		height:33%;
		position:relative;
	}
		
	.graphPart2{
		width:100%;
		height:33%;
		position:relative;
	}
		
	.graphPart3{
		width:100%;
		height:33%;
		position:relative;
	}
	
	
	.iframe{
		width:100%;
		height:100%;
		position:relative;
		margin:0;
		border:0;

	}
</style>
<script type="text/javascript">
window.onload = function () {
 
var totalVisitors = <%out.print(total);%>;
var abandonedData = {
	"Abandoned Animal": [{
		click: ChartDrilldownHandler,
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
	}],
	"입양/기증": [[{
			name: "유기동물 보호 지역",
			color: "#6d78ad",
			type: "column",
			xValueType: "count",
			dataPoints: <%out.print(a17orgNm);%>}],
		[{
			name: "유기 발생 시기",
			color: "#6d78ad",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17happenMth);%>}],
		[{
			name: "유기 동물 성장 상태",
			color: "#6d78ad",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17age);%>}],
		[{
			name: "유기 동물 사이즈",
			color: "#6d78ad",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17size);%>}],
		[{
			name: "유기 동물 성별",
			color: "#6d78ad",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17sex);%>}],
		[{
			name: "유기 동물 중성화 상태",
			color: "#6d78ad",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17neuter);%>}]],
	"안락사/자연사": [[{
			name: "유기동물 보호 지역",
			color: "#51cda0",
			type: "column",
			xValueType: "count",
			dataPoints: <%out.print(d17orgNm);%>}],
		[{
			name: "유기 발생 시기",
			color: "#51cda0",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17happenMth);%>}],
		[{
			name: "유기 동물 성장 상태",
			color: "#51cda0",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17age);%>}],
		[{
			name: "유기 동물 사이즈",
			color: "#51cda0",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17size);%>}],
		[{
			name: "유기 동물 성별",
			color: "#51cda0",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17sex);%>}],
		[{
			name: "유기 동물 중성화 상태",
			color: "#51cda0",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17neuter);%>}]],
	"반환": [[{
			name: "유기동물 보호 지역",
			color: "#df7970",
			type: "column",
			xValueType: "count",
			dataPoints: <%out.print(r17orgNm);%>}],
		[{
			name: "유기 발생 시기",
			color: "#df7970",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17happenMth);%>}],
		[{
			name: "유기 동물 성장 상태",
			color: "#df7970",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17age);%>}],
		[{
			name: "유기 동물 사이즈",
			color: "#df7970",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17size);%>}],
		[{
			name: "유기 동물 성별",
			color: "#df7970",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17sex);%>}],
		[{
			name: "유기 동물 중성화 상태",
			color: "#df7970",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17neuter);%>}]]
};
 
var pieOptions = {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "2017년 유기동물 보호상태"
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
 
var DrilldownedChartOptions = {
	animationEnabled: true,
	theme: "light2",
	data: []
};
 
var chart = new CanvasJS.Chart("chartContainer", pieOptions);
chart.options.data = abandonedData["Abandoned Animal"];
chart.render();
 
function ChartDrilldownHandler(e) {
	//alert(JSON.stringify(abandonedData[e.dataPoint.label][0]));		// 받은 파라미터의 내용을 확인
	//alert(JSON.stringify(abandonedData[e.dataPoint.label][0][0]["name"]));
	chart = new CanvasJS.Chart("orgNm", DrilldownedChartOptions);
	chart.options.data = abandonedData[e.dataPoint.label][0];
	chart.options.title = { text: abandonedData[e.dataPoint.label][0][0]["name"] }
	chart.render();	
	
	chart = new CanvasJS.Chart("happenMth", DrilldownedChartOptions);
	chart.options.data = abandonedData[e.dataPoint.label][1];
	chart.options.title = { text: abandonedData[e.dataPoint.label][1][0]["name"] }
	chart.render();	

	chart = new CanvasJS.Chart("age", DrilldownedChartOptions);
	chart.options.data = abandonedData[e.dataPoint.label][2];
	chart.options.title = { text: abandonedData[e.dataPoint.label][2][0]["name"] }
	chart.render();	

	chart = new CanvasJS.Chart("size", DrilldownedChartOptions);
	chart.options.data = abandonedData[e.dataPoint.label][3];
	chart.options.title = { text: abandonedData[e.dataPoint.label][3][0]["name"] }
	chart.render();	

	chart = new CanvasJS.Chart("sex", DrilldownedChartOptions);
	chart.options.data = abandonedData[e.dataPoint.label][4];
	chart.options.title = { text: abandonedData[e.dataPoint.label][4][0]["name"] }
	chart.render();	

	chart = new CanvasJS.Chart("neuter", DrilldownedChartOptions);
	chart.options.data = abandonedData[e.dataPoint.label][5];
	chart.options.title = { text: abandonedData[e.dataPoint.label][5][0]["name"] }
	chart.render();	
}
}
</script>
<style>
</style>
</head>
<body>
<div class="wrap">
	<div class="graphZone1">
		<div id="chartContainer" style="height: 70%; width: 99%;"></div>
	</div>
	<div class="graphZone2" src="bubble.jsp">		
		<div class="graphPart1">
				<div id="orgNm" style="height: 100%; width: 50%; float:left;"></div>
				<div id="happenMth" style="height: 100%; width: 50%; float:left;"></div>
		</div>		
		<div class="graphPart2">
				<div id="age" style="height: 100%; width: 50%; float:left;"></div>
				<div id="size" style="height: 100%; width: 50%; float:left;"></div>
		</div>
		<div class="graphPart3">
				<div id="sex" style="height: 100%; width: 50%; float:left;"></div>
				<div id="neuter" style="height: 100%; width: 50%; float:left;"></div>
		</div>
	</div>
</div>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>        