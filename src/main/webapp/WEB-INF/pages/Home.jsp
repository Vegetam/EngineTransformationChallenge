<!DOCTYPE html>

<html>

<head>
<meta http-equiv="refresh" content="60">
<link rel="shortcut icon"
	href="http://www.francescomalagrino.com/favicon.ico">
<title>Great Portland Street Underground Station</title>
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

	<h2>Trains Schedule Timetable</h2>



	<div>

		<p style="float: left" id="allTrains"></p>

		<p style="float: left; padding: 8px;" id="platforms"></p>

	</div>

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

							if (myJsonObj[x].lineName == "Circle") {

								table += "<tbody><tr><td><span class='span-yellow'></span>"
										+ myJsonObj[x].destinationName
										+ "</td><td>"
										+ myJsonObj[x].platformName
										+ "</td><td>";

								table += (myJsonObj[x].timeToStation == 0) ? "Now"
										: myJsonObj[x].timeToStation + " min";

								table += "</td></tr>";

							}

							else if (myJsonObj[x].lineName == "Hammersmith & City")

							{

								table += "<tbody><tr><td><span class='span-pink'></span>"
										+ myJsonObj[x].destinationName
										+ "</td><td>"
										+ myJsonObj[x].platformName
										+ "</td><td>";

								table += (myJsonObj[x].timeToStation == 0) ? "Now"
										: myJsonObj[x].timeToStation + " min";

								table += "</td></tr>";

							}

							else

							{

								table += "<tbody><tr><td><span class='span-purple'></span>"
										+ myJsonObj[x].destinationName
										+ "</td><td>"
										+ myJsonObj[x].platformName
										+ "</td><td>";

								table += (myJsonObj[x].timeToStation == 0) ? "Now"
										: myJsonObj[x].timeToStation + " min";

								table += "</td></tr>";

							}

						}
					}
				

				table += "</tbody></table>"

				document.getElementById("allTrains").innerHTML = table;

			} else {

				document.getElementById("allTrains").innerHTML = this.responseText;

			}

		};

		xmlhttp.open("GET", "/api/trains", true);

		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		xmlhttp.send("x=" + jsonParam);

		xmlplatformhttp = new XMLHttpRequest();

		xmlplatformhttp.onreadystatechange = function() {

			if (this.readyState == 4 && this.status == 200) {

				platforms = JSON.parse(this.responseText);

				table1 = "";
				
					for (x in platforms) {
						table1 += "<table class='table table-dark'><thead><tr><th scope='col' >Platform: "
							+ x

							+ "</th></tr><tr><th scope='col'>Destination</th><th scope='col'>Arrive In</th></tr></thead>";
						for (y in platforms[x]) {

							if (platforms[x][y].destinationName) {

								if (platforms[x][y].lineName == "Circle") {

									table1 += "<tbody><tr><td><span class='span-yellow'></span>"
											+ platforms[x][y].destinationName
											+ "</td><td>";

									table1 += (platforms[x][y].timeToStation == 0) ? "Now"
											: platforms[x][y].timeToStation
													+ " min";

									table1 += "</td></tr>";

								} else if (platforms[x][y].lineName == "Hammersmith & City") {

									table1 += "<tbody><tr><td><span class='span-pink'></span>"
											+ platforms[x][y].destinationName
											+ "</td><td>";

									table1 += (platforms[x][y].timeToStation == 0) ? "Now"
											: platforms[x][y].timeToStation
													+ " min";

									table1 += "</td></tr>";

								} else {

									table1 += "<tbody><tr><td><span class='span-purple'></span>"
											+ platforms[x][y].destinationName
											+ "</td><td>";

									table1 += (platforms[x][y].timeToStation == 0) ? "Now"
											: platforms[x][y].timeToStation
													+ " min";

									table1 += "</td></tr>";

								}

							}

						}

					}

				table1 += "</tbody></table>"

				document.getElementById("platforms").innerHTML = table1;

			}

		};

		xmlplatformhttp.open("GET", "/api/trainsByPlatform", true);

		xmlplatformhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		xmlplatformhttp.send("x=" + jsonParam);
	</script>



</body>

</html>