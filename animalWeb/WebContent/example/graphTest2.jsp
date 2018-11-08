<html>
	<head>
	    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	 	<script type="text/javascript">
	 	google.charts.load("current", {packages:['corechart']});
	 	google.charts.setOnLoadCallback(drawChart);
	 	function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['year', 'Dogs', 'Cats', 'The Others'],
				['2009', 17913, 6897, 133],
				['2010', 42142, 19882, 824],
				['2011', 38185, 21522, 896],
				['2012', 46351, 29634, 975],
				['2013', 57499, 23322, 1006],			
				['2014', 57882, 20345, 1023],			
				['2015', 58220, 20602, 923],
				['2016', 62541, 24539, 1095],
				['2017', 73023, 26543, 1157]
				]);
			var options = {				
					width: 600,
	                height: 600,
	                legend: { position: 'top', maxLines: 3 },
	                bar: { groupWidth: '75%' },
	                isStacked: true
	                };
			
			var chart = new google.visualization.ColumnChart(document.getElementById('container'));
            chart.draw(data, options);
         }
	 	</script>
	</head>
	<body>
		<div id="container" style="width: 900px; height: 500px;"></div>
	</body>
</html>