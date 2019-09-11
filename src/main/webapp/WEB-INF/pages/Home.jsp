<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>

<head>
<meta http-equiv="refresh" content="60">
<link rel="shortcut icon"
	href="http://www.francescomalagrino.com/favicon.ico">
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