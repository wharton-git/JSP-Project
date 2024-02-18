<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Liste des Employés</title>
<link rel="stylesheet" href="./style/tailwindV2.2.19.min.css">
<link rel="stylesheet" href="./style/style.css">
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
							<a href="#"
								class="bg-gray-900 transition duration-300 ease text-white rounded-md px-3 py-2 text-sm font-medium"
								aria-current="page">Liste</a> <a href="pieChart.jsp"
								class="text-gray-300 transition duration-300 ease hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Graph</a>
						</div>
					</div>
				</div>
				<div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
					<a href="addEmploye.html" class="bg-blue-800 text-white transition duration-300 ease hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">+ Employé</a>
				</div>
			</div>
		</div>
		</div>

		<!-- Mobile menu, show/hide based on menu state. -->
		<div class="sm:hidden" id="mobile-menu">
			<div class="space-y-1 px-2 pb-3 pt-2">
				<!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
				<a href="#" class="bg-gray-900 transition duration-300 ease text-white block rounded-md px-3 py-2 text-base font-medium" aria-current="page">Liste</a> 
				<a href="/jspSujet3/list" class="transition duration-300 ease text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">Graph</a>
			</div>
		</div>
	</nav>



	<div
		class="bg-gradient-to-r from-gray-800 to-gray-600 h-screen text-white">

		<!-- Code Jsp -->



		<div
			class="flex flex-col items-center w-screen min-h-screen bg-gray-900 py-10">
			<!--     <h1 class="text-4xl">Liste des Employés</h1> -->

			<p>
				<% if (request.getAttribute("msg") != null){%>
				<%= request.getAttribute("msg")%>
				<%} %>
			</p>
			<!-- Component Start -->
			<div class="flex flex-col mt-6">
				<div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
					<div
						class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
						<div class="shadow overflow-hidden sm:rounded-lg">
							<table class="min-w-full text-sm text-gray-400">
								<thead class="bg-gray-800 text-xs uppercase font-medium">
									<tr>
										<th></th>
										<th scope="col" class="px-6 py-3 text-left tracking-wider">
											Nom</th>
										<th scope="col" class="px-6 py-3 text-left tracking-wider">
											Salaire</th>
										<th scope="col" class="px-6 py-3 text-left tracking-wider">
											OBS</th>
										<th scope="col" class="px-6 py-3 text-left tracking-wider">
											Modifier</th>
										<th scope="col" class="px-6 py-3 text-left tracking-wider">
											Supprimer</th>

									</tr>
								</thead>

								<tbody class="bg-gray-800">
									<% 
            ArrayList<String[]> employe = (ArrayList<String[]>) request.getAttribute("listeEmp");
            for (String[] emp : employe) {
        %>
									<tr class="bg-black bg-opacity-20 hover:bg-opacity-10 transition duration-150">
										<td class="pl-4"><%= emp[0] %></td>
										<td class="flex px-6 py-4 whitespace-nowrap"><span
											class="ml-2 font-medium"><%= emp[1] %></span></td>
										<td class="px-6 py-4 whitespace-nowrap"><%= emp[2] %></td>
										<td class="px-6 py-4 whitespace-nowrap"><%= emp[3] %></td>
										<td class="px-6 py-4 whitespace-nowrap"><a
											class="bg-yellow-200 px-2 py-1 rounded-lg text-black hover:bg-yellow-300 transition duration-300 ease"
											href="/jspSujet3/modify?id=<%= emp[0] %>">Modifier</a></td>
										<td class="px-6 py-4 whitespace-nowrap"><a
											class="bg-red-400 px-2 py-1 rounded-lg text-black hover:bg-red-500 transition duration-300 ease"
											href="/jspSujet3/delete?id=<%= emp[0] %>">Supprimer</a></td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- Component End  -->
			<div class="bg-gray-800 m-5 rounded-lg px-10">
				<span>Total Salaire : <%= request.getAttribute("total") %>
					----
				</span> <span>Salaire Minimal : <%= request.getAttribute("min") %>
					----
				</span> <span>Salaire Maximal : <%= request.getAttribute("max") %>
				</span>
			</div>

		</div>

	</div>
</body>
</html>