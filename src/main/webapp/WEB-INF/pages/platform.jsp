<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<script type="text/javascript">

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

								

									table1 += "<tbody><tr><td>" + getColor(platforms[x][y].lineName)
											+ platforms[x][y].destinationName
											+ "</td><td>";

									table1 += getTime(platforms[x][y].timeToStation);

									table1 += "</td></tr>";


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
