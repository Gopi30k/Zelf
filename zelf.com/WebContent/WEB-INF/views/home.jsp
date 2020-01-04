<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Zelf.com</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	color: #404E67;
	background: #F5F7FA;
	font-family: 'Open Sans', sans-serif;
}

.table-wrapper {
	width: 700px;
	margin: 30px auto;
	background: #fff;
	padding: 20px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 10px;
	margin: 0 0 10px;
}

.table-title h2 {
	margin: 6px 0 0;
	font-size: 22px;
}

.table-title .add-new {
	float: right;
	height: 30px;
	font-weight: bold;
	font-size: 12px;
	text-shadow: none;
	min-width: 100px;
	border-radius: 50px;
	line-height: 13px;
}

.table-title .add-new i {
	margin-right: 4px;
}

table.table {
	table-layout: fixed;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table th:last-child {
	width: 100px;
}

table.table td a {
	cursor: pointer;
	display: inline-block;
	margin: 0 5px;
	min-width: 24px;
}

table.table td a.add {
	color: #27C46B;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}

table.table td a.add i {
	font-size: 24px;
	margin-right: -1px;
	position: relative;
	top: 3px;
}

table.table .form-control {
	height: 32px;
	line-height: 32px;
	box-shadow: none;
	border-radius: 2px;
}

table.table .form-control.error {
	border-color: #f50000;
}

table.table td .add {
	display: none;
}
</style>
<script type="text/javascript">
function callJqueryAjax(){
	$.ajax({
	url     : '/zelf.com//updateMyProfile',
	async: false,
	method     : 'POST',
	data     : {
		resource_id : $('#resourceId').val(),
		first_name : $('#first_name').text(),
		last_name : $('#last_name').text(),
		user_name : $('#user_name').text(),
		email : $('#email').text(),
		phone : $('#phone').text(),
		address : $('#address').text(),
		bioInfo : $('#bio').text()
		}
	});
}
$(document).ready(function(){
	
	$('[data-toggle="tooltip"]').tooltip();
	var actions = $("table td:last-child").html();

	// Add row on add button click
	$(document).on("click", ".add", function(){
		var empty = false;
		var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function(){
			if(!$(this).val()){
				$(this).addClass("error");
				empty = true;
			} else{
                $(this).removeClass("error");
            }
		});
		$(this).parents("tr").find(".error").first().focus();
		if(!empty){
			input.each(function(){
				$(this).parent("td").html($(this).val());
			});			
			$(this).parents("tr").find(".add, .edit").toggle();
			$(".add-new").removeAttr("disabled");
		}		
    });
	// Edit row on edit button click
	$(document).on("click", ".edit", function(){
		console.log($('#userName').val());
        $(this).parents("tr").find("td:nth-last-of-type(2)").each(function(){
			$(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
		});		
		$(this).parents("tr").find(".add, .edit").toggle();
    });

});
</script>
</head>
<body>
	<form method="post" onsubmit="callJqueryAjax()">
		<div class="container">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-8">
							<h2>
								<b>My Profile</b>
							</h2>
						</div>
					</div>
				</div>
				<input type="hidden" value=${resource.resourceid} id="resourceId">
				<table class="table">
					<tbody>
							<td><b>First Name :</b></td>
							<td id="first_name">${resource.firstname}</td>
							<td><a class="add" title="Update" data-toggle="tooltip"><i
									class="material-icons">&#xE03B;</i></a> <a class="edit"
								title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
							</td>
						</tr>
						<tr>
							<td><b>Last Name :</b></td>
							<td id="last_name">${resource.lastname}</td>
							<td><a class="add" title="Update" data-toggle="tooltip"><i
									class="material-icons">&#xE03B;</i></a> <a class="edit"
								title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
							</td>
						</tr>
						<tr>
							<td><b>User Name :</b></td>
							<td id="user_name">${resource.username}</td>
							<td><a class="add" title="Update" data-toggle="tooltip"><i
									class="material-icons">&#xE03B;</i></a> <a class="edit"
								title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
							</td>
						</tr>
						<tr>
							<td><b>Email :</b></td>
							<td id="email">${resource.email}</td>
							<td><a class="add" title="Update" data-toggle="tooltip"><i
									class="material-icons">&#xE03B;</i></a> <a class="edit"
								title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
							</td>
						</tr>
						<tr>
							<td><b>Phone :</b></td>
							<td id="phone">${resource.phonenumber}</td>
							<td><a class="add" title="Update" data-toggle="tooltip"><i
									class="material-icons">&#xE03B;</i></a> <a class="edit"
								title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
							</td>
						</tr>
						<tr>
							<td><b>Address :</b></td>
							<td id="address">${resource.address}</td>
							<td><a class="add" title="Update" data-toggle="tooltip"><i
									class="material-icons">&#xE03B;</i></a> <a class="edit"
								title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
							</td>
						</tr>	
						<tr>
							<td><b>Bio :</b></td>
							<td id="bio">${resource.bioInfo}</td>
							<td><a class="add" title="Update" data-toggle="tooltip"><i
									class="material-icons">&#xE03B;</i></a> <a class="edit"
								title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
							</td>
						</tr>

					</tbody>
				</table>
				<input type="submit" value="submit" 
					class="btn btn-primary btn-block"
					style="width: 100px; margin: 0 auto;">
			</div>
		</div>

		</div>
	</form>
</body>
</html>
