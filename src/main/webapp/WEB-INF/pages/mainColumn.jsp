<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<script type="text/javascript">

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
