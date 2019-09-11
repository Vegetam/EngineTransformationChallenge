<!DOCTYPE html>

<html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
<meta http-equiv="refresh" content="60">
<link rel="shortcut icon"
	href="http://www.francescomalagrino.com/favicon.ico">
<title>Main Column</title>
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



</head>

<body>

	<script type="text/javascript">
		var obj, jsonParam, xmlhttp, myJsonObj, x, table, table1, platforms = "";

		obj = {

			table : "Trains",

			limit : 20

		};

		jsonParam = JSON.stringify(obj);

		xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function() {

			if (this.readyState == 4 && this.status == 200) {

				myJsonObj = JSON.parse(this.responseText);

				table = "<table class='table table-dark'>"

				table += "<thead><tr><th>Destination</th><th>Platform</th><th>Arrive In</th></tr></<thead>";
					for (x in myJsonObj) {

						if (myJsonObj[x].destinationName) {

							
								table += "<tbody><tr><td>" + getColor(myJsonObj[x].lineName)
										+ myJsonObj[x].destinationName
										+ "</td><td>"
										+ myJsonObj[x].platformName
										+ "</td><td>";

								table += getTime(myJsonObj[x].timeToStation);

								table += "</td></tr>";

						}
					}
				

				table += "</tbody></table>"

				document.getElementById("allTrains").innerHTML = table;

			} else {

				document.getElementById("allTrains").innerHTML = this.responseText;

			}

		};

		
	</script>



</body>

</html>