<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./style/tailwindV2.2.19.min.css">
<link rel="shortcut icon" href="img/JspProjIcon.png" type="image/x-icon">
<title>Modifier</title>
</head>
<body>
	<div
		class="flex flex-col items-center w-screen min-h-screen bg-gray-900 py-10">
		<form action="/jspSujet3/modify" method="post" class="w-6/12">

			<div class="mb-10 sm:col-span-3">
				<label for="nom"
					class="block text-sm font-medium leading-6 text-white">Nom
					Complet</label>
				<div class="mt-2">
					<input type="text" name="nom" id="first-name"
						value="<%= request.getAttribute("nom") %>"
						autocomplete="given-name"
						class="bg-gray-800 text-white px-10 block w-full rounded-md border-0 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
				</div>
			</div>

			<div class="mb-10 sm:col-span-3">
				<label for="salaire"
					class="block text-sm font-medium leading-6 text-white">Salaire</label>
				<div class="mt-2">
					<input type="text" name="salaire" id="salaire"
						value="<%= request.getAttribute("salaire") %> "
						autocomplete="given-name"
						class="bg-gray-800 text-white px-10 block w-full rounded-md border-0 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
				</div>
			</div>
			<input type="text" name="id" id="id"
				value="<%= request.getAttribute("id") %>" hidden> <input
				type="submit" value="Enregister"
				class="transition duration-300 ease float-right rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
			<a href="/jspSujet3/list"
				class="transition duration-300 ease float-right mx-3 rounded-md bg-red-500 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Annuler</a>
		</form>
	</div>

</body>
</html>