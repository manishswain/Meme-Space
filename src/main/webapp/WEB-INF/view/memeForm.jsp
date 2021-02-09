<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<title>Meme Share</title>
<style type="text/css">
.oform {
	width: 50%;
	margin-left: 25%;
}

center {
	color: violet;
}

.no_two {
	height: 50%;
	overflow: auto;
}

.no_two_inside {
	width: 50%;
	margin-left: 25%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<center>
			<h1>Meme Stream</h1>
		</center>
	</div>
	<div class="container no_one">
		<form:form class="oform" action="processForm" modelAttribute="memes"
			method="POST">
			<%-- <form:hidden path="memeId"/> --%>
			<div class="mb-3">
				<label for="oname" class="form-label">Meme Owner</label>
				<form:input type="text" class="form-control" id="oname"
					placeholder="Enter Your Full Name" path="name" />
			</div>
			<div class="mb-3">
				<label for="ocaption" class="form-label">Caption</label>
				<form:textarea class="form-control" id="ocaption" rows="3"
					placeholder="Be creative with the caption" path="caption" />
			</div>
			<div class="mb-3">
				<label for="ourl" class="form-label">Meme URL</label>
				<form:input type="text" class="form-control" id="ourl"
					placeholder="Enter URL of your meme here" path="url" />
			</div>
			<button type="submit" class="btn btn-primary">Submit Meme</button>
		</form:form>
	</div>
	<hr>
	<div class="container no_two">
		<div class="no_two_inside" id="out"></div>
	</div>

	<script type="text/javascript">
		var staticUrl = 'https://vast-dusk-16065.herokuapp.com/memes';
		$.getJSON(staticUrl, function(data) {
			for (i = 0; i < data.length; i++) {
				var cname = document.createElement('p');
				cname.innerText = data[i].name; //Put name instead of id here
				var cdate = document.createElement('p');
				cdate.innerText = data[i].date; //Put date instead of id here
				var ccaption = document.createElement('p');
				ccaption.innerText = data[i].caption; //Put caption instead of id here
				var cimg = document.createElement('img');
				cimg.src = data[i].url; //Put memeUrl instead of id here
				cimg.style.width = "400px";
				cimg.style.height = "400px";
				parent = document.getElementById("out");
				parent.appendChild(cname);
				parent.appendChild(cdate);
				parent.appendChild(ccaption);
				parent.appendChild(cimg);
			}
		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous">		
	</script>
</body>
</html>
