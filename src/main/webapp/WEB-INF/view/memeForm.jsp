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

.move {
	float: right;
	position: sticky;
	top: 0;
}

.move:hover {
	background-color: green;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<center>
			<h1>Meme Space</h1>
		</center>
	</div>
	<div class="container no_one" id="top">
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
					placeholder="Enter something creative!!" path="caption" />
			</div>
			<div class="mb-3">
				<label for="ourl" class="form-label">Meme URL</label>
				<form:input type="text" class="form-control" id="ourl"
					placeholder="Enter in this format-https://img.bhs4.com/be/5/large.jpg" path="url" />
			</div>
			<button type="submit" class="btn btn-primary">Submit Meme</button>
		</form:form>
	</div>
	<hr>
	<a href="#top"><button class="move">Move to Top</button></a>
	<div class="container no_two">
		<div class="no_two_inside" id="out"></div>
	</div>

	<script type="text/javascript">
		var staticUrl = 'https://vast-dusk-16065.herokuapp.com/memes';
		$.getJSON(staticUrl, function(data) {
			for (i = 0; i < 20; i++) {
				console.log(data[i]);
				var divcard = document.createElement('div');
				var divcardbd = document.createElement('div');
				var cardtitle = document.createElement('h5');
				var cardtext = document.createElement('p');
				var dt = document.createElement('span');
				var cardtext2 = document.createElement('p');
				var dtin = document.createElement('small');
				var image = document.createElement('img');
				var space = document.createElement('br');
				var space2 = document.createElement('br');
				var icon0 = document.createElement('a');
				var icon = document.createElement('span');
				divcard.className = "card";
				divcardbd.className = "card-body";
				cardtitle.className = "card-title";
				cardtext.className = "card-text";
				cardtext2.className = "card-text";
				dtin.className = "text-muted";
				image.className = "card-img-bottom";
				icon.className = "badge bg-secondary";
				icon0.href = "#";
				icon.innerText = "Edit";
				icon.style.marginLeft = "20px";
				icon.title = "hui";
				icon0.appendChild(icon);
				cardtitle.innerText = data[i].name;
				cardtext.innerText = data[i].caption;
				dtin.innerHTML = data[i].date;
				cardtext2.appendChild(dtin);
				cardtext2.style.display = "inline";
				cardtext2.style.marginLeft = "20px";
				dt.appendChild(cardtext2);
				image.src = data[i].url;
				image.style.height = "auto";
				image.style.width = "400px";
				image.alt = "Meme Not Found";
				cardtitle.style.display = "inline";
				divcardbd.appendChild(cardtitle);
				divcardbd.appendChild(dt);
				divcardbd.appendChild(icon0);
				divcardbd.appendChild(cardtext);
				divcardbd.style.height = "auto";
				divcardbd.style.width = "400px";
				divcard.appendChild(divcardbd);
				divcard.appendChild(image);
				var output = document.getElementById("out");
				divcard.style.height = "auto";
				divcard.style.width = "400px";
				output.appendChild(divcard);
				output.appendChild(space);
				output.appendChild(space2);
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
