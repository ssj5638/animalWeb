<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%-- 2015년도부터 2017년도의 동물 종류 불러오기 각 Table에서 데이터 불러오기 --%>

<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false";
		String id = "root"; 		// 사용자계정
		String pw = "plus_1004";
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rs2015 = null;
			ResultSet rs2016 = null;
			ResultSet rs2017 = null;
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			String sql1 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2015;";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			
			String sql2 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2016;";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			
			String sql3 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2017;";
			PreparedStatement pstmt3 = conn.prepareStatement(sql2);
			
			rs2015 = pstmt1.executeQuery();
			rs2016 = pstmt2.executeQuery();
			rs2017 = pstmt3.executeQuery();
			
			JSONObject opObj2015 = new JSONObject();
			JSONObject opObj2016 = new JSONObject();
			JSONObject opObj2017 = new JSONObject();
			
			while(rs2015.next()){
				String year = "2015";
				System.out.println(year);
				int dogs = rs2015.getInt("Dogs");
				System.out.println(dogs);
				int cats = rs2015.getInt("Cats");
				System.out.println(cats);
				int theOthers = rs2015.getInt("The_Others");
				System.out.println(theOthers); 
				
				opObj2015.put("Year", year);
				opObj2015.put("Dogs", dogs);
				opObj2015.put("Cats", cats);
				opObj2015.put("The_Others", theOthers);
				barlist.add(opObj2015);
			}
			responseObj.put("barlist", barlist);
			while(rs2016.next()){
				String year = "2016";
				System.out.println(year);
				int dogs = rs2016.getInt("Dogs");
				System.out.println(dogs);
				int cats = rs2016.getInt("Cats");
				System.out.println(cats);
				int theOthers = rs2016.getInt("The_Others");
				System.out.println(theOthers);

				opObj2016.put("Year", year);
				opObj2016.put("Dogs", dogs);
				opObj2016.put("Cats", cats);
				opObj2016.put("The_Others", theOthers);
				barlist.add(opObj2016);
			}
			responseObj.put("barlist", barlist);
			while(rs2017.next()){
				String year = "2017";
				System.out.println(year);
				int dogs = rs2017.getInt("Dogs");
				System.out.println(dogs);
				int cats = rs2017.getInt("Cats");
				System.out.println(cats);
				int theOthers = rs2017.getInt("The_Others");
				System.out.println(theOthers);

				opObj2017.put("Year", year);
				opObj2017.put("Dogs", dogs);
				opObj2017.put("Cats", cats);
				opObj2017.put("The_Others", theOthers);
				barlist.add(opObj2017);
			}
			responseObj.put("barlist", barlist);
			out.print(responseObj.toString());
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		if(conn != null){
			try{
				conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
%>