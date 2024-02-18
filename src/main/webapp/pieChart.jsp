<%@page import="back.calc.extract"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./style/tailwindV2.2.19.min.css">
<link rel="stylesheet" href="./style/style.css">
<link rel="shortcut icon" href="img/JspProjIcon.png" type="image/x-icon">
</head>
<body class="overflow-hidden transition duration-300 ease">
	<nav class="bg-gray-800">
		<div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
			<div class="relative flex h-16 items-center justify-between">
				<div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
				</div>
				<div
					class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
					<div class="hidden sm:ml-6 sm:block">
						<div class="flex space-x-4">
							<!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
							<a href="/jspSujet3/list"
								class="text-gray-300 transition duration-300 ease hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Liste</a>
							<a href="#"
								class="bg-gray-900 transition duration-300 ease text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium"
								aria-current="page">Graph</a>
						</div>
					</div>
				</div>
				<div
					class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
					<a href="addEmploye.html"
						class="transition duration-300 ease bg-blue-800 text-white hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">
						+ Employé</a>
				</div>
			</div>
		</div>
		</div>

		<!-- Mobile menu, show/hide based on menu state. -->
		<div class="sm:hidden" id="mobile-menu">
			<div class="space-y-1 px-2 pb-3 pt-2">
				<!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->

				<a href="/jspSujet3/list"
					class="text-gray-300 transition duration-300 ease hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">Liste</a>
				<a href="#"
					class="bg-gray-900 transition duration-300 ease text-white block rounded-md px-3 py-2 text-base font-medium"
					aria-current="page">Graph</a>
			</div>
		</div>
	</nav>
	<%
		
		int total = Integer.parseInt(back.calc.extract.total());
		int min = Integer.parseInt(back.calc.extract.minimun());
		int max = Integer.parseInt(back.calc.extract.maximum());
		
		int tauxMax =(max * 100)/total;
		int tauxMin =(min * 100)/total;
		int autreSalaire = 100 - (tauxMax + tauxMin);
		
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		
		map = new HashMap<Object,Object>(); map.put("label", "Taux de Salaire Maximal"); map.put("y", tauxMax); list.add(map);
		map = new HashMap<Object,Object>(); map.put("label", "Taux de salaire Minimal"); map.put("y", tauxMin); list.add(map);
		map = new HashMap<Object,Object>(); map.put("label", "Taux autre Salaire"); map.put("y", autreSalaire); list.add(map);

		
		String dataPoints = gsonObj.toJson(list);
		%>
	<div class="bg-gray-900 h-screen text-white">
		<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	</div>
	<script type="text/javascript">
		window.onload = function() { 
		
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			backgroundColor: "rgb(17,24,39)",
			title:{
				text: "Taux des Salaires",
				fontColor: "white"
			},
			legend: {
				verticalAlign: "center",
				horizontalAlign: "right",
				fontColor: "white"
			},
			data: [{
				type: "pie",
				showInLegend: true,
				indexLabel: "{y}%",
				indexLabelPlacement: "outside",
				legendText: "{label}: {y}%",
				toolTipContent: "<b>{label}</b>: {y}%",
				indexLabelFontColor: "white",
				dataPoints : <%out.print(dataPoints);%>
				
			}]
		});
		chart.render();
		
		}
		</script>
	<script src="script/canvasjs.min.js"></script>
</body>
</html>
