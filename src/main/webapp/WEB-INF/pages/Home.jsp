<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>

<head>
<meta http-equiv="refresh" content="60">
<link rel="shortcut icon"
	href="http://www.francescomalagrino.com/favicon.ico">
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style type="text/css">
h2 {
	text-align: center;
}

.table-grey {
	background: #f7f7f7;
	margin-left: 10px;
}

.table-dark {
	margin-left: 15px;
}

.table td, .table th {
	position: relative;
}

.white {
	background-color: white;
}

.span-yellow {
	background: #ffce00;
	position: absolute;
	left: 1px;
	bottom: 10px;
	top: 10px;
	width: 10px
}

.span-pink {
	background: #d799af;
	position: absolute;
	left: 1px;
	bottom: 10px;
	top: 10px;
	width: 10px
}

.span-purple {
	background: #751056;
	position: absolute;
	left: 1px;
	bottom: 10px;
	top: 10px;
	width: 10px
}
</style>
<script>
var obj, jsonParam, xmlhttp, myJsonObj, x, table, table1, platforms = "";

obj = {

	table : "Trains",

	limit : 20

};

jsonParam = JSON.stringify(obj);
</script>
<title>Great Portland Street Underground Station</title>
</head>

<body>
<script>
	function getColor(line) 
	{
		var color = "";
			if(line != null) {
					if(line == "Circle") {
						color = "<span class='span-yellow'></span>";
					}
					else if (line == "Hammersmith & City") {
						color="<span class='span-pink'></span>"
					
					}else {
						color = "<span class='span-purple'></span>";
					}
			}
		return color;
	}
	
	function getTime(time) 
	{
		
	var timeString = "";

	if(time !=  null) 
		{
			if(time == 0) {
				timeString = "Now";
			}else if(time == 2 ) {
				timeString = "Soon";
			}else {
				timeString = time + " Min";
			}
		}
	return timeString;
	}

</script>
	<h2>Trains Schedule Timetable</h2>
	<div>

		<p style="float: left" id="allTrains"></p>

		<p style="float: left; padding: 8px;" id="platforms"></p>

	</div>
	
	<jsp:include page="mainColumn.jsp" />
	<jsp:include page="platform.jsp" />



</body>

</html>