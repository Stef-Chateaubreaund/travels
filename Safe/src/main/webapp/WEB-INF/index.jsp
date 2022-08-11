<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Books</title>
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head><body>
<h1>Save Travels</h1>
			<table class="p" id="fruit">
			<thead>	<tr>
											<th scope="col" class="h4 text-center">gastos</th>
											<th scope="col" class="h4 text-center">vendor</th>
											<th scope="col" class="h4 text-center">valor</th>
											<th scope="col" class="h4 text-center">o que </th></tr></thead>
											
			<tbody><c:forEach var="expense" items="${expenses}">
			<tr><td scope="row"><a href="/expenses/showOne/${expense.id}">
	
			<td><c:out value="${expense.name}"></c:out></td>
			<p><c:out value="${expense.vendor}"></c:out></p></a></td>
			<p><c:out value="${expense.amount}"></c:out></p></a></td>
			<p><c:out value="${expense.name}"></c:out></p></a></td>
														
		<p value="${expense.amount}" type="currency" /></p></td>
			<td scope="row"><p class="text-center">
			<a href="/expenses/showOne/${expense.id}">view</a>
			<span> | </span>
			<a href="/expenses/update/${expense.id}">edit</a>
			<span> | </span>
			<a href="/expenses/delete/${expense.id}">delete</a></p></td></tr></c:forEach></tbody></table>
			
			
			<div><form:form action="/" method="post" modelAttribute="expense">

								<div class="mb-3">
									<p>
										<form:label path="name">gasto</form:label>
										<form:errors path="name" class="text-danger h5" />
										<form:input path="name" class="form-control text-dark" placeholder="expense name" />
										
									</p>
								</div>

								<div class="mb-3">
									<p>
										<form:label path="vendor">quem vendeu</form:label>
										<form:errors path="vendor" class="text-danger h5" />
										<form:input path="vendor" class="form-control" placeholder="vendor" />
									</p>
								</div>

								<div class="mb-3">
									<p>
										<form:label path="amount">valor</form:label>
										<form:errors path="amount" class="text-danger h5" />
										<form:input type="number" step="0.01" path="amount" class="form-control w-25" placeholder="amount" />
									</p>
									
									
									<input type="submit" value="Add New Expense" class="btn btn-warning float-start" />
								</div>			

										
														
								
							



</form:form>
</div>
</body>
</html>